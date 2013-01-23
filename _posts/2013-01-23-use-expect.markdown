---
layout: default
title: expect 用法小记
---

使用expect实现交互式登录。

###安装expect
ubuntu 下默认没有安装expect， 所以需要安装。还有spawn命令需要安装tcl。

{% highlight sh %}
sudo apt-get install tcl tk expect
{% endhighlight %}

###脚本如下：

{% highlight sh linenos=table %}
#!/usr/bin/expect
set timeout 30
set pwd "yourpassword"
spawn ssh serverip
expect "Password:"
send "$pwd\r"
interact
{% endhighlight %}
