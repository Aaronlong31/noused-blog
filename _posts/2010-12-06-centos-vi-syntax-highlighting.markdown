---
layout: post
title: centos vi 语法高亮显示
wordpress_id: 152
wordpress_url: http://192.168.13.105/?p=152
categories:
- linux
tags:
- centos
- vi
- 语法高亮
---
#vi /etc/profile.d/vim.sh将[ $tmpid -le 100 ] && return注释[bash]if [ -n &quot;$BASH_VERSION&quot; -o -n &quot;$KSH_VERSION&quot; -o -n &quot;$ZSH_VERSION&quot; ]; then    [ -x /usr/bin/id ] || return    tmpid=$(/usr/bin/id -u)    [ &quot;$tmpid&quot; = &quot;&quot; ] &amp;&amp; tmpid=0    # [ $tmpid -le 100 ] &amp;&amp; return    # for bash and zsh, only if no alias is already set    alias vi &gt;/dev/null 2&gt;&amp;1 || alias vi=vim  fi[/bash]然后source /etc/profile.d/vim.sh
