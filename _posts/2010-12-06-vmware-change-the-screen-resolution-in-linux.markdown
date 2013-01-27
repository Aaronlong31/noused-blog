---
layout: post
title: 修改VMware中Linux屏幕分辨率
wordpress_id: 187
wordpress_url: http://192.168.13.105/?p=187
categories:
- linux
tags:
- linux
- 分辨率
- vmware
---
我用过Ubuntu和CentOS，Ubuntu的很好改，直接修改分辨率就行了，但CentOS比较麻烦，我说说我的修改过程。1.下载VMware tools。安装完系统后，会在VMware下面出现一个工具条，要你安装VMware tools，点击install，会在Linux系统中出现一个VMware tools的光盘2.将VMware tools光盘中的VMware tools-8.1.3-203739.tar.gz复制到自己的文件夹中，比如/usr/local/vmware tools：cp /media/VMWare Tools/VMware Tools-8.1.3-203739.tar.gz /usr/local/vmware tools3.解压缩tar -zxvf VMware Tools-8.1.3-203739.tar.gz4.解压完后会有个vmware-tools-distrib目录，执行其中的vmware-install.plcd vmware-tools-distrib./vmware-install.pl5.安装完成后选择系统-->显示-->硬件-->配置-->Generic LCD Display，选择你要的分辨率，确定，在设置选项卡中，选择分辨率，再次确定，注销，进入即可。
