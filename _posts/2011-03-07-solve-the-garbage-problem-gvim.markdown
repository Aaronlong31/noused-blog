---
layout: post
title: 解决gvim乱码问题
wordpress_id: 368
wordpress_url: http://www.zlong.org/?p=368
categories:
- vim
tags:
- vim
---
在Vim目录下的_vimrc文件(无后缀名)的末尾加上以下两句:let &amp;termencoding=&amp;encodingset fileencodings=utf-8,gbk
