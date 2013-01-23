---
layout: default
title: expect 用法小记
---
使用expect实现交互式登录。

1. 安装expect

{% highlight sh %}
sudo apt-get install tcl tk expect
{% endhighlight %}

2. 脚本如下：

{% highlight sh %}
#!/usr/bin/expect
set timeout 30
set pwd "yourpassword"
spawn ssh serverip
expect "Password:"
send "$pwd\r"
interact
{% endhighlight %}
