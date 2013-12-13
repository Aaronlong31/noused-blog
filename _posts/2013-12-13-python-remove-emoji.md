---
layout: post
title: "Python中删除emoji字符"
description: "使用utf8_general_ci的mysql数据库不能存放emoji字符，所以要删除"
category: 
tags: [python]
---
在使用UCS-2编码的python中，对超过`\U0000FFFF`的编码，用2 byte来实现，所以在写正则表达式时，应该用2byte的表达式：

{% highlight python %}
ma = re.compile(u'[\uD800-\uDBFF][\uDC00-\uDFFF]')
{% endhighlight %}

这个表达式能匹配任一2byte的UTF-16编码字符，将超过`\U0000FFFF`的字符转为UTF-16编码的规则如下：

1. 码位减去0x10000,得到的值的范围为20比特长的0..0xFFFFF.
2. 高位的10比特的值（值的范围为0..0x3FF）被加上0xD800得到第一个码元或称作高位代理（high surrogate），值的范围是0xD800..0xDBFF.由于高位代理比低位代理的值要小，所以为了避免混淆使用，Unicode标准现在称高位代理为前导代理(lead surrogates).
3. 低位的10比特的值（值的范围也是0..0x3FF）被加上0xDC00得到第二个码元或称作低位代理（low surrogate），现在值的范围是0xDC00..0xDFFF.由于低位代理比高位代理的值要大，所以为了避免混淆使用，Unicode标准现在称低位代理为后尾代理(trail surrogates).

> <a href="http://zh.wikipedia.org/wiki/UTF-16#.E4.BB.8EU.2B10000.E5.88.B0U.2B10FFFF.E7.9A.84.E7.A0.81.E4.BD.8D" target="_blank">http://zh.wikipedia.org/wiki/UTF-16</a>

在UCS-4 Python中则可以直接写为：

{% highlight python %}
ma = re.compile(u'[\uD800-\uDBFF][\uDC00-\uDFFF]')
{% endhighlight %}

为了兼容UCS-2 Python 和 UCS-4 Python，需要使用try/except:   

{% highlight python %}
try:
    # UCS-4
    ma = re.compile(u'[\U00010000-\U0010ffff]')
except re.error:
    # UCS-2 build
    ma = re.compile(u'[\uD800-\uDBFF][\uDC00-\uDFFF]')
{% endhighlight %}

替换之前，需要将文本转换为utf-8格式，写时也一样：
{% highlight python %}
text = open("text").readline()
a = ma.sub('', unicode(text, "utf-8"))
with open("text2", "w") as f:
    f.write(a.encode("utf-8"))
{% endhighlight %}

