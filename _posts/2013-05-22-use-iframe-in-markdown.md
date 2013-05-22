---
layout: post
title: "markdown中嵌入iframe"
description: ""
category: 
tags: [markdown]
---
{% include JB/setup %}

	<iframe src="http://slid.es/longzhang/deck/embed" width="576" height="420" scrolling="no" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

直接嵌入iframe代码即可，不过如果要jekyll中使用，需要修改为如下：

	<iframe src="http://slid.es/longzhang/deck/embed" width="576" height="420" scrolling="no" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true"> </iframe>

注意，在`</iframe>`前面要有空格，不然iframe后面的内容都不会输出。