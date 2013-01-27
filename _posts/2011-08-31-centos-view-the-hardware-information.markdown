---
layout: post
title: centos 下查看硬件信息
wordpress_id: 581
wordpress_url: http://www.zlong.org/?p=581
categories:
- linux
tags:
- centos
---
**一：使用CentOS常用命令查看cpu**more /proc/cpuinfo | grep "model name"   grep "model name" /proc/cpuinfo   [root@localhost /]# grep "CPU" /proc/cpuinfo   model name      : Intel(R) Pentium(R) Dual CPU E2180 @ 2.00GHz   model name      : Intel(R) Pentium(R) Dual CPU E2180 @ 2.00GHz   如果觉得需要看的更加舒服grep "model name" /proc/cpuinfo | cut -f2 -d:**二：使用CentOS常用命令查看内存**grep MemTotal /proc/meminfo  grep MemTotal /proc/meminfo | cut -f2 -d:  free -m |grep "Mem" | awk '{print $2}'**三：使用CentOS常用命令查看cpu是32位还是64位**查看CPU位数(32 or 64)getconf LONG_BIT**四：使用CentOS常用命令查看当前linux的版本**more /etc/redhat-releasecat /etc/redhat-release**五：使用CentOS常用命令查看内核版本**uname -runame -a**六：使用CentOS常用命令查看当前时间**date上面已经介绍如何同步时间了**七：使用CentOS常用命令查看硬盘和分区**df -hfdisk -l也可以查看分区du -sh可以看到全部占用的空间du /etc -sh可以看到这个目录的大小**八：使用CentOS常用命令查看安装的软件包**查看系统安装的时候装的软件包cat -n /root/install.logmore /root/install.log | wc -l查看现在已经安装了那些软件包rpm -qarpm -qa | wc -lyum list installed | wc -l不过很奇怪，我通过rpm，和yum这两种方式查询的安装软件包，数量并不一样。没有找到原因。**九：使用CentOS常用命令查看键盘布局**cat /etc/sysconfig/keyboardcat /etc/sysconfig/keyboard | grep KEYTABLE | cut -f2 -d=**十：使用CentOS常用命令查看selinux情况**sestatussestatus | cut -f2 -d:cat /etc/sysconfig/selinux**十一：使用CentOS常用命令查看ip，mac地址**在ifcfg-eth0 文件里你可以看到mac，网关等信息。  ifconfig  cat /etc/sysconfig/network-scripts/ifcfg-eth0 | grep IPADDR  cat /etc/sysconfig/network-scripts/ifcfg-eth0 | grep IPADDR | cut -f2 -d=  ifconfig eth0 |grep "inet addr:" |awk '{print $2}'|cut -c 6-  ifconfig   | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'  查看网关  cat /etc/sysconfig/network  查看dns  cat /etc/resolv.conf  十二：使用CentOS常用命令查看默认语言echo $LANG $LANGUAGEcat /etc/sysconfig/i18n**十二：使用CentOS常用命令查看所属时区和是否使用UTC时间**cat /etc/sysconfig/clock**十三：使用CentOS常用命令查看主机名**hostnamecat /etc/sysconfig/network修改主机名就是修改这个文件，同时最好也把host文件也修改。**十四：使用CentOS常用命令查看开机运行时间**uptime09:44:45 up 67 days, 23:32, ... dmidecode |more查看主板信息 
