---
layout: post
title: gvim关闭自动备份
wordpress_id: 366
wordpress_url: http://www.zlong.org/?p=366
categories:
- vim
tags:
- vim
---
默认情况下用gVim编辑文件时，会自动生成带~的备份文件。但这个备份功能有时候并不实用，还可能烦人。可以用以下方法关闭：1、打开gVim，进入“编辑”-“启动设定”2、在文件开始位置添加 set nobackup 语句3、退出并保存配置文件 :wq
