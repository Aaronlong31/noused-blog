---
layout: default
title: Use Highlight in Github Page 
---

###Install pygment

{% highlight sh %}
sudo apt-get install python-setuptools
sudo easy_install Pygments
{% endhighlight %}

###Generate style file by Pygments

{% highlight sh %}
pygmentize -S default -f html > css/pygments/highlight.css
{% endhighlight %}

default is a style. Pygments ships some builtin styles which are maintained by the Pygments team.
To get a list of known styles you can use this snippet:
 
{% highlight python %}
>>> from pygments.styles import STYLE_MAP
>>> STYLE_MAP.keys()
['default', 'emacs', 'friendly', 'colorful']
['monokai', 'manni', 'rrt', 'perldoc', 'borland', 'colorful', 'default', 'murphy', 'vs', 'trac', 'tango', 'fruity', 'autumn', 'bw', 'emacs', 'vim', 'pastie', 'friendly', 'native']
{% endhighlight %}

###Add the css file to _layout/default.html.

{% highlight css %}
<link rel="stylesheet" href="/css/pygments/highlight.css" />
{% endhighlight %}

###Modify your _config.yml add this:

{% highlight yaml %}
pygments: true
{% endhighlight %}

###Done!

---
####Reference:
1. <http://pygments.org/docs/styles/>
