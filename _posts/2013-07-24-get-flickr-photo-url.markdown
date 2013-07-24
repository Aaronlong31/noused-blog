---
layout: post
title: "获取Flickr照片下载链接"
description: "通过chrome extension获取Flickr照片集中所有照片这种大小的链接"
category: 
tags: [chrome-extension, flickr]
---
{% include JB/setup %}

最近需要下载flickr上的照片集,发现很不好弄,网站上只支持一张一张的下载,并且下载一张就要点很多次鼠标,很麻烦.上网也找了些下载工具,没一个能正常工作的,不是报错就是要付费.偶然发现了一个chrome extension, [DownFlickr][1],用了以后发现还不错,只是下载照片是直接用浏览器下载,每次最多打开5个tab,如果我要下载200张,那得累死我了.不过我看了下它的源代码,原来可以通过flickr的api直接获取到照片的地址.那我就索性自己写个简单的extension,只要获取到照片的下载地址,下载任务交给下载工具得了.  
Extension地址: [GetFlickrImageUrl][2]  
源码地址:[Github Project][3]  

[1]: https://chrome.google.com/webstore/detail/downflickr-flickr-downloa/idiemcijhbenngdhkdiipmpkafnkbkeg "DownFlickr"
[2]: https://chrome.google.com/webstore/detail/getflickrimageurl/hdldceeeiighhmjgodphijoefcnnpgcn
[3]: https://github.com/Aaronlong31/GetFlickrImageUrl
