---
layout: post
title: Linux/windows 下 tomcat 的JVM设置
wordpress_id: 167
wordpress_url: http://192.168.13.105/?p=167
categories:
- linux
- tomcat
tags:
- tomcat
- linux
- windows
- jvm
---
Linux上：在/usr/tomcat/bin/catalina.sh中加入export JAVA_OPTS='-Xms[初始化内存大小] -Xmx[可以使用最大内存]'例如：export JAVA_OPTS='-Xms512m -Xmx512m'Windows上：在catalina.bat里设置初始内存和最大内存:set CATALINA_OPTS="-Xms512m -Xmx512m"检查一下Catalina.bat文件，在每个“%_RUNJAVA%”后面都应该有“%CATALINA_OPTS%”有的Catalina.bat文件在“%_RUNJAVA%”后面跟着“%JAVA_OPTS%”，如果是这样，应该设置：set JAVA_OPTS=-Xms30m -Xmx512m或者在每个“%_RUNJAVA%”后面加上“%CATALINA_OPTS%"
