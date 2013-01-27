---
layout: post
title: LINUX 去除DOS文件行末的^M.
wordpress_id: 169
wordpress_url: http://192.168.13.105/?p=169
categories:
- linux
tags:
- linux
---
在windows下编写了sh脚本上传到Linux上后，不能运行。脚本中有空行，回车，报错为：command not found假设脚本为hello.sh，可以在Linux上运行dos2unix hello.sh，这样就行了。
