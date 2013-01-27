---
layout: post
title: linux配置IP
wordpress_id: 185
wordpress_url: http://192.168.13.105/?p=185
categories:
- linux
tags:
- linux
---
在网上查找了配置linux配置IP的方法，简单的有下面三种：**第一种，最常用的给网卡配置ip的命令为:**_＃ifconfig eth0 192.168.0.1 netmask 255.255.255.0 up_说明：eth0是第一个网卡，其他依次为eth1，eth*192.168.0.1是给网卡配置的第一个网卡配置的ip地址netmask 255.255.255.0 配置的是子网掩码up是表示立即激活ifconfig的更多参数说明查看相关帮助<!--more-->**第二种：在命令行中执行setup，会弹出choose a tool对话框。**选择network configuration->Edit Devices->选择网卡，在这里就可以配置了，和windows上差不多。配置完后要记得save。**第三种：手动改/etc/sysconfig/network-scripts/ifcfg-eth0文件**vi打开ifcfg-eth0文件，假设这里要对eth0进行配置：vi /etc/sysconfig/network-scripts/ifcfg-eth0原内容：[bash]DEVICE=eth0BOOTPROTO=dhcpHWADDR=00:03:47:2C:D5:40ONBOOT=yesTYPE=Ethernet[/bash]改为：[bash]DEVICE=eth0BOOTPROTO=staticIPADDR=192.168.1.223NETMASK=255.255.255.0GATEWAY=192.168.1.1HWADDR=00:0uu3:47:2C:D5:40ONBOOT=yesTYPE=Ethernet[/bash]分别执行命令/sbin/ifdown eth0/sbin/ifup eth0/etc/init.d/network restart  //使设置的网关马上生效ifup － 代表拨号的连接命令，该命令只要在命令行或终端中可以成功执行就可以了 ifdown - 代表断开连接的命令，同样该命令只要在命令行或终端中可以成功执行就可以了**设置DNS**在上面的setup弹出框中就能设置，还有就是修改配置文件：/etc/resolv.confnameserver 202.102.24.35 指定了dns服务器的地址
