---
layout: post
title: ! ' 在Linux下为tomcat编辑启动脚本'
wordpress_id: 176
wordpress_url: http://192.168.13.105/?p=176
categories:
- linux
- tomcat
tags:
- tomcat
- linux
---
在使用解压缩安装tomcat时，并不会将tomcat设置成服务，因此需要自己手动设置。设置步骤如下：<!--more-->[root@sample ~]# vi /etc/rc.d/init.d/tomcat　 ← 建立Tomcat启动脚本，如下：[bash]#!/bin/bash## Startup script for the tomcat## chkconfig: 345 80 15# description: Tomcat is a Servlet+JSP Engine.# Source function library.. /etc/rc.d/init.d/functions JAVA_HOME=/usr/java/jdk1.6.0_19CATALINA_HOME=/usr/local/tomcatexport JAVA_HOME CATALINA_HOME start(){if [ -z $(/sbin/pidof java) ]; thenecho &quot;Starting tomcat&quot;/usr/local/tomcat/bin/startup.shtouch /var/lock/subsys/tomcatelseecho &quot;tomcat allready running&quot;fi}stop(){if [ ! -z $(/sbin/pidof java) ]; thenecho &quot;Shutting down tomcat&quot;/usr/local/tomcat/bin/shutdown.shuntil [ -z $(/sbin/pidof java) ]; do :; donerm -f /var/lock/subsys/tomcatelseecho &quot;tomcat not running&quot;fi}case &quot;$1&quot; instart)start;;stop)stop;;restart)stopstart;;status)/usr/local/tomcat/bin/catalina.sh version;;*)echo &quot;Usage: $0 {start|stop|restart|status}&quot;esacexit 0[/bash][root@sample ~]# chmod 755 /etc/rc.d/init.d/tomcat　 ← 将启动脚本属性设置为755（使之可执行）[root@sample ~]# chkconfig --add tomcat　 ← 将Tomcat加入到chkconfig中[root@sample ~]# chkconfig tomcat on 　 ← 将Tomcat设置为自启动[root@sample ~]# chkconfig --list tomcat　 ← 确认Tomcat服务状态tomcat 0:off 1:off 2:on 3:on 4:on 5:on 6:off　 ← 确认2~5为on的状态就OK[root@sample ~]# /etc/rc.d/init.d/tomcat start　 ← 启动Tomcat也可以使用：service tomcat startStarting tomcatUsing CATALINA_BASE: /usr/local/tomcatUsing CATALINA_HOME: /usr/local/tomcatUsing CATALINA_TMPDIR: /usr/local/tomcat/tempUsing JAVA_HOME: /usr/local/jdk1.5.0_08
