---
layout: post
title: mongodb一直在启动的问题
wordpress_id: 429
wordpress_url: http://www.zlong.org/?p=429
categories:
- MongoDB
tags:
- mongodb
---
![](http://media.mongodb.org/logo-mongodb.png "MongoDB")我的是Windows的机器，今天发现MongoDB访问不了，查看服务，状态是启动，表示正在启动，但没启动起来；查看任务管理器里的服务状态，一直是“正在启动”和“启动”来回变动；查看日志，发现以下错误：exception in initAndListen std::exception: old lock file, terminating删了mongod.lock就好了。
