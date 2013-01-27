---
layout: post
title: mysql导入导出数据
wordpress_id: 211
wordpress_url: http://192.168.13.105/?p=211
categories:
- mysql
tags:
- mysql
---
   mysqldump  - uroot  - p123456  - d webmeeting  > C:\\test.sql        -- 将数据库webmeeting中的表结构导出到C:\\test.sql中        mysqldump  - uroot  - p123456 webmeeting  > 123 .sql     -- 将数据库中所有数据导出到123.sql中        mysql  - uroot  - p123456 webmeeting  < c:\\ 123 .sql   -- 将123.sql中的数据导入到数据库webmeeting中
