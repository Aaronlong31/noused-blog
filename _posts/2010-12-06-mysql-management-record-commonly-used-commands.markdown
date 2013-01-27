---
layout: post
title: MySQL管理常用命令记录
wordpress_id: 165
wordpress_url: http://192.168.13.105/?p=165
categories:
- mysql
tags:
- mysql
---
**mysql 添加用户：**GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost'IDENTIFIED BY 'some_pass' WITH GRANT OPTION;**mysql修改用户密码：**SET PASSWORD FOR 'jeffrey'@'%' = PASSWORD('biscuit');**mysql删除用户：**DROP USER 'monty'@'localhost';这里只记录了一点点，以后会陆续更新。
