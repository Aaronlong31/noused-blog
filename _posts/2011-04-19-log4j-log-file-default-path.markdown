---
layout: post
title: log4j日志文件默认路径
wordpress_id: 404
wordpress_url: http://www.zlong.org/?p=404
categories:
- tomcat
tags:
- log4j
---
使用log4j时，日志文件的默认路径是在tomcat/bin下，如果要放在tomcat/logs下，需要使用一下配置：log4j.appender.aa.File=../logs/aa.log
