---
layout: post
title: 卸载CentOS 5.4自带的OpenJDK，配置新的Java环境
wordpress_id: 182
wordpress_url: http://192.168.13.105/?p=182
categories:
- java
- linux
tags:
- java
- centos
- jdk
---
本文CentOS版本为5.4 final，使用图形界面与命令结合的操作方式.由于CentOS 5.4在默认情况下，会安装OpenOffice之类的软件，而这些软件需要Java支持，因此系统会默认安装一个JDK环境，如果需要使用特定的Java环境，最好将这些默认安装的JDK卸载或者彻底删除。<!--more-->在安装完成CentOS 5.4之后，直接在终端中输入“java -version”，系统会显示当前的jdk版本号“java-1.6.0-openjdk-1.6.0.0-1.7.b09.el5”，可以看到jdk使用的是openjdk1.6版本的。如果此时，直接在centOS的“应用程序--添加/删除软件--基本系统--java”中，删除java，与之相关的openoffice等软件，也会自动随之删除，因此，在进行原有的jdk删除之前，最好先安装配置好新的JDK及相应的环境。首先，在Sun（现在属于Oracle）的网站下载相应的JDK版本，这里使用的是目前最新的JDK6.0_update21版本，在下载时，建议下载-rpm的安装文件，将下载完成的文件放在指定位置，这里直接放在/usr下。默认下载的JDK文件名较长，可以根据需要修改文件名，这里修改为“jdk-6u21.bin”。其次，在jdk所在目录中打开终端，给当前用户赋予执行权限，“chmod +x jdk-6u21.bin”，或者直接在图形界面下右击文件，在弹出菜单中依次选择“属性”--“权限”，选择“以程序执行文件”复选框，“确定”按钮，完成执行权限的赋予。然后，在jdk所在目录中打开终端，在终端中输入“./jdk-6u21.bin”执行解压及安装操作。此时，在“/usr”目录下，新增一个“/java”目录，另外，会有一些以“sun”开头的rpm文件，这些文件不用理会。接下来，设置Java的环境变量。用文本编辑器打开/etc/profile（说明：根目录下的/etc/目录，其中的profile文件）在profile文件末尾加入如下字符串  JAVA_HOME=/usr/java/jdk1.6.0_21  PATH=$JAVA_HOME/bin:$PATH  CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar  export JAVA_HOME  export PATH  export CLASSPATH至此，新的JDK环境安装配置完成。接下来，删除原有的jdk环境。首先，在终端中输入“rpm -qa|grep gcj”，查看gcj的版本号，在这里得到的结果是：        java-1.4.2-gcj-compat-1.4.2.0-40jpp.115        libgcj-4.1.2-48.el5其次，卸载系统自带jdk。在终端中输入“yum -y remove java java-1.4.2-gcj-compat-1.4.2.0-40jpp.115”，然后等待，等待系统卸载完自带的jdk。最终在终端中显示“Complete!”，卸载完成。至此，关于CentOS的JDK配置基本完成，重启系统。在终端中输入“java -version”，系统显示：java version "1.6.0_21"Java(TM) SE Runtime Environment (build 1.6.0_21-b06)Java HotSpot(TM) Client VM (build 17.0-b16, mixed mode, sharing)JDK安装成功！
