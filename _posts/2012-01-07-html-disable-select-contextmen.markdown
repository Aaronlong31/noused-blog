---
layout: post
title: 页面禁止选择、右键菜单
wordpress_id: 632
wordpress_url: http://www.zlong.org/?p=632
categories:
- web
tags: []
---
不需要JS，只需要在目标标签上加上以下代码： <pre class="brush: html; gutter: true; first-line: 1; highlight: []; html-script: false">onselectstart=&quot;return false&quot; oncontextmenu= &quot;return false&quot;</pre>如果想让整个页面都禁止，则将以上代码加到body标签中。
