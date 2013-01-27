---
layout: post
title: 将你的博客加入到右键菜单
wordpress_id: 495
wordpress_url: http://www.zlong.org/?p=495
categories:
- 未分类
tags: []
---
把你的博客地址加到右键菜单，这样你打开你的博客就方便了。这个是效果图：[caption id="attachment_496" align="aligncenter" width="308" caption="鼠标右键菜单"][![鼠标右键菜单](http://www.zlong.org/wp-content/uploads/2011/06/right.png "鼠标右键菜单")](http://www.zlong.org/wp-content/uploads/2011/06/right.png)[/caption]<!--more-->方法：1. 打开注册表：HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\Background\shell2. 新建项，输入名字，随便输，不要和之前的冲突即可，比如我的是zlong；3. 选中新建的项，双击右边的默认项，输入数据，该值为在右键菜单中要显示的名称，我的是我的域名：www.zlong.org；4. 在新建的zlong项下面再新建一项，名字为：Command；5. 设置Command的数据，格式为  explorer http://www.zlong.org；6. 在桌面上右击，看看，是不是出来了，点击下，看看效果吧！
