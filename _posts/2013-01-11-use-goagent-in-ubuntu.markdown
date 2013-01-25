---
layout: default
title: 在Ubuntu中使用goagent
---

1. 安装 python
    {% highlight sh%}
    sudo apt-get install python
    {% endhighlight %}
2. 下载goagent
3. 安装GAE for linux，下载地址: https://developers.google.com/appengine/downloads , 下载后解压到/home/username/tools/google_appengine
4. goagent现在托管在github上，地址: https://github.com/goagent/goagent ， 最好fork一下，创建自己的一份copy，以后修改配置文件就修改自己的好了。以我的为例，我的goagent地址: https://github.com/Aaronlong31/goagent
4. 下载goagent到google_appengine目录:

    git clone  git@github.com:Aaronlong31/goagent.git /home/username/google_appengine/goagent
