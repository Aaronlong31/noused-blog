---
layout: page
title: Home
tagline: Post List
---
{% include JB/setup %}

<ul class="posts">
    <li><span></span> &raquo; <a href="demo/three-view">理科生三行情诗-三视图</a></li>
    <li><span></span> &raquo; <a href="demo/sort">动态排序</a></li>
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

