---
layout: post
title: ! 'linux防火墙设置 '
wordpress_id: 157
wordpress_url: http://192.168.13.105/?p=157
categories:
- linux
tags:
- linux
- 防火墙
---
查看防火墙信息[shell]/etc/init.d/iptables status[/shell]开启指定端口[shell]/sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT/etc/rc.d/init.d/iptables save[/shell]或者编辑/etc/sysconfig/iptables添加行：[shell]-A RH-Firewall-1-INPUT -m state –state NEW -m tcp -p tcp –dport 8080 -j ACCEPT #也可使用-I INPUT -p tcp --dport 8080 -j ACCEPT[/shell]使更改的防火墙生效[shell]/etc/init.d/iptables restart #不推荐使用重启系统方式[/shell]关闭防火墙服务[shell]/etc/init.d/iptables stop[/shell]永久关闭防火墙[shell]chkconfig –level 35 iptables off #此方法源自网络，未实验，安全考虑拒绝使用此方法[/shell]
