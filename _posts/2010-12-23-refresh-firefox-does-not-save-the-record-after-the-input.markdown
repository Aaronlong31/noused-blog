---
layout: post
title: firefox中刷新后input不保存记录
wordpress_id: 338
wordpress_url: http://www.zlong.org/?p=338
categories:
- web
tags: []
---
在firefox中，当你往input中输入值后，刷新页面，输入的值还在，有时这个功能不错，有时却有麻烦，使用一下方法可以解决。&lt;input name="username"  type="type"  id="username"** AUTOCOMPLETE="off"** value="" /&gt;加上**AUTOCOMPLETE="off"**后刷新页面就不会保存值了。
