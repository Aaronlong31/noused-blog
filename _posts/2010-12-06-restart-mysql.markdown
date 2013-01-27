---
layout: post
title: 重启mysql
wordpress_id: 172
wordpress_url: http://192.168.13.105/?p=172
categories:
- linux
- mysql
tags:
- mysql
---
RedHat Linux (Fedora Core/Cent OS)1.启动：/etc/init.d/mysqld start2.停止：/etc/init.d/mysqld stop3.重启：/etc/init.d/mysqld restartDebian / Ubuntu Linux1.启动：/etc/init.d/mysql start2.停止：/etc/init.d/mysql stop3.重启：/etc/init.d/mysql restart<!--more-->Windows1.点击“开始”-&gt;“运行”（快捷键Win+R）2.启动：输入 net stop mysql3.停止：输入 net start mysql提示Redhat Linux 也支持service command，启动：# service mysqld start停止：# service mysqld stop重启：# service mysqld restartWindows下不能直接重启(restart)，只能先停止，再启动。
