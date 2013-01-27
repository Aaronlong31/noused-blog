---
layout: post
title: Linux环境下定时备份MySQL数据
wordpress_id: 193
wordpress_url: http://192.168.13.105/?p=193
categories:
- linux
- mysql
tags:
- mysql
- linux
---
1.增加任务表打开 crontab文件# vi /etc/crontab添加任务，在crontab文件里添加01 23 * * * root /usr/local/mysql/bin/backup.sh表示每天23点01分，以root身份执行备份数据库的脚本backup.sh,crontab文件的格式为：分钟 小时 日期 月 星期 执行的文件名 （*代表所有条件）2.备份数据库的脚本如下：bakdate=`date +%Y%m%d`tar cvfz /var/mysql/dev.mysql.data.$bakdate.tar.gz /var/mysql/data别忘了# chmod +x /usr/local/mysql/bin/backup.sh3.重起定时服务# /etc/rc.d/init.d/crond restart搞定了吧。
