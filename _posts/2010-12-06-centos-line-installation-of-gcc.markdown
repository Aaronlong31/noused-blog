---
layout: post
title: centos 在线安装 gcc
wordpress_id: 145
wordpress_url: http://192.168.13.105/?p=145
categories:
- linux
tags:
- centos
---
在网上找了很多安装gcc的方法，大都是通过光盘安装的，要copy一堆文件，况且每个版本的centos这些文件还不一样，容易弄错，后来终于找到一个在线安装的方法，避免忘记，在这里记录一下：yum -y install gcc automake autoconf libtool make再安装一下gcc-c++：yum install gcc gcc-c++
