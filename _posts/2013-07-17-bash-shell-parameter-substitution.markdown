---
layout: post
title: "如何样像高手一样使用Bash字符串替换"
description: ""
category: linux
tags: [linux]
---
{% include JB/setup %}
>英文原文：[HowTo: Use Bash Parameter Substitution Like A Pro][1]  

我们可以使用$字符串来做参数、命令替换。你可以使用它对变量做一些扩展操作，而不是使用复杂的sed和awk。
 
###1.设置Shell变量默认值
语法如下：

    ${parameter:-defaultValue}
    var=${parameter:-defaultValue}

如果`parameter`没有设置值，则`var`为`defaultValue`。在这个例子中，shell脚本接收命令行参数，你可以将一些最常用的值作为默认值，这样就不用每次都输入它们了。比如下面的例子，如果$1没有值，则使用root作为默认值赋值给u:

```
u=${1:-root}
```

再来看看下面的例子：

```
#!/bin/bash
_jail_dir="${1:-/home/phpcgi}"
echo "Setting php-cgi at ${_jail_dir}..."
# rest of the script ...
```

你可以像这样执行脚本：

```
./script.sh /jail          	# <--- set php jail at /jail dir
./script.sh /home/httpd/jail   # <---- set php jail at /home/httpd/jail dir
./script.sh                	# <--- set php jail dir at /home/phpcgi (default)
```

再看另一个例子：

```
_mkdir(){
    	local d="$1"           	# get dir name
    	local p=${2:-0755}  	# get permission, set default to 0755
    	[ $# -eq 0 ] && { echo "$0: dirname"; return; }
    	[ ! -d "$d" ] && mkdir -m $p -p "$d"
}
```

使用替换扩展可以防止一些因没有提供命令行参数导致的问题。
####1.1 为变量设置默认值
语法如下：
```
${var:=value}
var=${USER:=value}
```
`:=`操作符是当变量没有值时为其提供一个默认值。
看例子，执行下面这句：

```
echo $USER
```

会输出：
```
aaron
```
如果给$USER做一下操作：

```
echo ${USER:=foo}
```

输出还是一样：
```
aaron
```
这时候删除$USER变量值：

``` shell
unset USER
echo ${USER:=foo}
```

输出则为：

``` shell
foo
```

这能保证脚本中的变量能有一个合理的值。
提示：`${var:-defaultValue}` vs  `${var:=defaultValue}`
请注意，`:=`操作不能用在位置参数(positional parameter)：

``` shell
var=${1:=defaultValue}  ### FAIL with an error cannot assign in this way
var=${1:-defaultValue}	### Perfect
```

还有个区别，如果var没有值，执行${var:-defaultValue}过后，var还是没有值的，而执行${var:=defaultValue}过后，`var`的值就是`defaultValue`。

###2 如果变量$VAR没有值则提示错误信息  

如果变量没有定义或是没有设置值，你可以使用以下语法停止执行bash脚本：

```
${varName?Error varName is not defined}
${varName:?Error varName is not defined or is empty}
${1:?"mkjail: Missing operand"}
MESSAGE="Usage: mkjail.sh domainname IPv4"         	### define error message
_domain=${2?"Error: ${MESSAGE}"}  ### you can use $MESSAGE too
```

####2.1 显示错误信息并执行命令
在下面的例子中，如果$2没有值，将会显示错误信息，并执行 cp 命令
 
###3 获取变量长度
可以通过以下方式轻松的获取变量的长度：

```
${#variableName}
echo ${#variableName}
len=${#var}
```

这里有个简单的用于添加ftp用户的脚本：

```
#!/bin/bash
# Usage : Add a ftp user
_fuser="$1"
_fpass="$2"
 
# die if username/password not provided 
[ $# -ne 2 ] && { echo "Usage: addftpuser username password"; exit 1;}
 
# Get username length and make sure it always <= 8
[[ ${#_fuser} -ge 9 ]] && { echo "Error: Username should be maximum 8 characters in length. "; exit 2;}
 
# Check for existing user in /etc/passwd 
/usr/bin/getent passwd "${_fuser}" &>/dev/null
 
# Check exit status
[ $? -eq 0 ] && { echo "Error: FTP username \"${_fuser}\" exists."; exit 3; }
 
# Add user 
/sbin/useradd -s /sbin/nologin -m  "${_fuser}"
echo "${_fpass}" | /usr/bin/passwd "${_fuser}" --stdin
```

###4 删除匹配（前置方式）
语法：

```
${var#Pattern}          
${var##Pattern}
```

可以从变量var前面查找pattern并删除。在下面的例子中，将会删除/etc/部分，只剩下filename:

```
f="/etc/resolv.conf"
echo ${f#/etc/}
```

上面的两种语法中，第一种是查找最短匹配并删除，第二种是查找最长匹配并删除。看看下面的例子：

```
_version="20090128"
_url="http://dns.measurement-factory.com/tools/dnstop/src/dnstop-${_version}.tar.gz"
```

为了得到文件名：`dnstop-20090128.tar.gz`，试试使用最短匹配：

```
echo "${_url#*/}"
```

输出：

```
/dns.measurement-factory.com/tools/dnstop/src/dnstop-20090128.tar.gz
```

现在试试最长匹配：

```
echo "${_url##*/}"
```

输出：

```
dnstop-20090128.tar.gz
```

OK。  
使用这种方式你可以很轻松的获取脚本名：
```
#!/bin/bash
_self="${0##*/}"
echo "$_self is called"
```
现在创建一个名为master.info的脚本：

```
#!/bin/bash
# Purpose: Display jail info as per softlink
# Author: Vivek Gite
_j="$@"
 
# find out script name
_self="${0##*/}"
 
[ "$VERBOSE" == "1" ] && echo "Called as $_self for \"$_j\" domain(s)"
 
for j in $_j
do
	export _DOMAIN_NAME=$j
	source functions.sh
	init_jail
        # call appropriate functions as per script-name / softlink 
	case $_self in
		uploaddir.info) echo "Upload dir for $j: $(get_domain_upload_dir)" ;;
		tmpdir.info) echo "/tmp dir for $j: $(get_domain_tmp_dir)" ;;
                mem.info) echo "$j domain mem usage (php+lighttpd): $(get_domain_mem_info)" ;;
                cpu.info) echo "$j domain cpu usage (php+lighttpd): $(get_domain_cpu_info)" ;;
                user.info) echo "$j domain user and group info: $(get_domain_users_info)" ;;
                diskquota.info) echo "$j domain disk quota info (mysql+disk): $(get_domain_diskquota_info)" ;;
		*) warn "Usage: $_self"
	esac
done
```

最后为`master.info`创建几个softlink:

```
# ln -s master.info uploaddir.info
# ln -s master.info tmpdir.info
# ln -s master.info mem.info
....
..
```

然后你能这样执行脚本：

```
# ./mem.info example.org
# ./cpu.info example.com example.net
```

####4.1 删除匹配（后置方式）
语法如下：

```
${var%pattern}
${var%%pattern}
```

用法和上面的一样，只不过是从变量var后面查找匹配并删除。在这个例子中，将会删除$FILE的.tar.gz后缀名：

```
FILE="xcache-1.3.0.tar.gz"
echo ${FILE%.tar.gz}
```

输出：

```
xcache-1.3.0
```

下面的例子是重命名所有的.perl文件为.pl文件。

```
for p in /scripts/projects/.devl/perl/*.perl
do
	mv "$p" "${p%.perl}.pl"
done
```

现在可以组合使用这些技巧了：

```
#!/bin/bash
# Usage: Build suhosin module for RHEL based servers
# Author: Vivek Gite
# ----
# Set default value for $2 
VERSION="-${2:-0.9.31}"
URL="http://download.suhosin.org/suhosin${VERSION}.tgz"
vURL="http://download.suhosin.org/suhosin${VERSION}.tgz.sig"
 
# Get tar ball names
FILE="${URL##*/}"
vFILE="${vURL##*/}"
DLHOME="/opt"
SOFTWARE="suhosin"
 
# Remove .tgz and get dir name
DEST="${FILE%.tgz}"
 
# Download software
wget $URL -O "${DLHOME}/$FILE"
wget $vURL -O "${DLHOME}/$vFILE"
 
# Extract it
tar -zxvf $FILE
cd "$DEST"
 
# Build it and install it
phpize --clean && phpize && ./configure && make && read -p "Update/Install $SOFTWARE [Y/n] ? " answer
shopt -s nocasematch
[[ $answer =~ y|es  ]] && make install
shopt -u nocasematch
```

###5 查找并替换
语法如下：

```
${varName/Pattern/Replacement}
${varName/word1/word2}
${os/Unix/Linux}
```

看使用sed的例子，查找unix并替换为linux:

```
x="Use unix or die"
sed 's/unix/linux/' <<<$x
```

现在你可以不使用sed:

```
echo "${x/unix/linux}"
out="${x/unix/linux}"
echo "${out}"
```

上面的例子只是替换第一个匹配的模式，使用下面的语法能替换所有匹配：

```
out="${x//unix/linux}"
```

轻松的重命名或删除文件：

```
y=/etc/resolv.conf
cp "${y}" "${y/.conf/.conf.bak}"
```

另一个例子：

```
# RHEL php modules path
_php_modules="/usr/lib64/php/modules"
for i in $_php_modules/*
do
	p="${i##*/}"                  ## Get module name
	ini="/etc/php.d/${p/so/ini}"  ## Get ini file by replacing .so with .ini extension 
             # make sure file exists 
	[ ! -f "$ini" ] && echo "$i php module exists but $ini file not found."
done
```

####6 截取字符
语法：

```
${parameter:offset}
${parameter:offset:length}
```

第一种是从offset处截取剩余字符串，第二种是从offset出截取长度为length的字符串。例子：

```
base="/backup/nas"
file="/data.tar.gz"
#### strip extra slash from $file  ####
path="${base}/${file:1}"
echo $path
```

输出：

```
/backup/nas/data.tar.gz
```

只截取单词craft：

```
x="nixcraft.com"
echo ${x:3:5}"
```

获得电话号码：

```
phone="022-124567887"
# strip std code
echo "${phone:4}"
```

总结：字符串操作和扩展变量  

express						|descript               
-----------------------------|----------------------
\${parameter:-defaultValue} |获取默认变量值     		
\${parameter:=defaultValue}	|设置默认变量值      		
\${parameter:?"Error Message"}	|当变量未设置时显示错误信息
\${#var}						|获取字符串长度  			
\${var%pattern}					|后置方式删除最短匹配		
\${var%%pattern}				|后置方式删除最长匹配		
\${var:num1:num2}				|截取字符串				
\${var#pattern}					|前置方式删除最短匹配		
\${var##pattern}				|前置方式删除最长匹配		
\${var/pattern/string}			|查找第一个匹配并替换		
\${var//pattern/string}			|查找所有匹配并删除		


> Written with [StackEdit](http://benweet.github.io/stackedit/).


  [1]: http://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
