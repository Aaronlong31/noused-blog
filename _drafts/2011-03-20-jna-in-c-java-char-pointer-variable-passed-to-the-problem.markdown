---
layout: post
title: JNA中C++的char指针变量传给java的问题
wordpress_id: 374
wordpress_url: http://www.zlong.org/?p=374
categories:
- 未分类
tags: []
---
在JNA中经常要用java模拟C++中的方法，C++中的char指针变量就是char数组，用java模拟时可以用char数组，但c++中的char是1个字节而java中的char是2个字节，所以要做适当转换。
