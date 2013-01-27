---
layout: post
title: 在frameset中的登陆界面session过期页面显示问题
wordpress_id: 387
wordpress_url: http://www.zlong.org/?p=387
categories:
- web
tags:
- js
---
有些时候做一些系统的后台页面需要使用框架页。一般来说都是一个登录界面，然后登录成功后跳转到控制台页面，这个页面使用了frameset。这时候就存在一个session失效的问题，如果登录失效，那么就会在管理台页面的一个子页面中重新显示登录界面了，这个是我不想看到的。 解决方法是：可以在登录页面中加入以下js代码。[javascript]if (top.location != self.location){  top.location=self.location;  } [/javascript]
