---
layout: post
title: 解决PowerDesigner 中 建Oracle数据库脚本双引号问题
wordpress_id: 514
wordpress_url: http://www.zlong.org/?p=514
categories:
- PowerDesigner
tags:
- PowerDesigner
---
使用PowerDesigner建Oracle数据库时，表中的表名、字段名如果不是全大写的，在生成脚本时，会自动加上双引号。解决办法很简单：打开DataBase --> Edit Current DBMS，在General选项卡中左侧窗口找到Script --> Format --> CaseSensitivityUsingQuote，选择value为No，这样就可以了。[caption id="attachment_515" align="aligncenter" width="389" caption="powerDesigner oracle"][![powerDesigner oracle](http://www.zlong.org/wp-content/uploads/2011/06/powerDesigner-oracle.png "powerDesigner oracle")](http://www.zlong.org/wp-content/uploads/2011/06/powerDesigner-oracle.png)[/caption]
