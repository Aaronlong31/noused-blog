---                                                                             
layout: post
title: 在Android上使用Font Icon
description: "使用fonticon能极大的方便Android应用开发"
category: articles
tags: [Android, FontIcon]
image:
  feature: font-icon.png

comments: true  
---

Android上的图标制作太麻烦了，要为各种屏幕准备不同尺寸的图标，有美工还好点，没有美工的话就只能上网找了，还不一定称心如意。  

我就是这样，到处找图标。直到有一天，发现了一套FontIcon的图标，煞是好看，查看下HTML源码，发现竟然是一段编码，`&#x001;`之类的，不知为何物，到处搜索后才明白，原来FontIcon就是一套字体，而`&#x001;`就是字体的编码，浏览器加载字体后，就把编码转换成相应的字体图案。

这种图标有很多的**优点**：

* 无失真的放大；
* 任意设置颜色；
* 体积很小；
* 只需准备一套字体；

以上优点恰恰非常适合Android应用，以后就基本上不需要去准备各种颜色大小的图标了。

在Android中使用也很简单，下载字体文件，一般是.ttf文件，然后设置view比如Button的text为相应的图标编码就可以了。来看看例子。

**首先下载图标**。比如这个[Font Awesome](http://www.bootcss.com/p/font-awesome)。这个包含了很多图标。如果嫌图标太多的话，可以到这个网站[IcoMoon](http://icomoon.io/app/#/select)，这里可以选择自己需要的图标，并且还可以进行简单的编辑，很是方便。  
下载完后，会看到有个.ttf文件，这就是字体文件。要想使用图标，得知道图标和编码的对应关系，这个关系一般能在CSS文件中发现。

接下来就是**获取图标和编码的映射关系**
在Android的体现就是string的res文件，比如  
{% highlight xml %}
<string name="icon_home">&#xe600;</string>
{% endhighlight %}
要获得这种对应关系很简单，解析下CSS文件就可以了，下面是使用linux命令来做的：

{% highlight sh %}
cat style.css | grep "content\|before\s\+{" | sed 'N;s/\n//g'| sed 's/-/_/g' | sed 's/\.\([a-z0-9_]*\):.*"\\\([a-z0-9]*\)";/<string name="\1">\&#x\2;<\/string>/p' | uniq
{% endhighlight %}
在字体目录运行上面的命令后就得到了`<string name="icon_home">&#xe600;</string>`这样的xml，将其加入到你的资源文件即可。 

下面说说**如何使用**，先要将ttf文件放入到Android的assets目录。然后写一个自定义的Button，在这个button中设置图标字体。下面是代码：

FontIconButton.java  
{% highlight java %}
public class FontIconButton extends Button {

    private static final String FONT_ICON_TTF = "font_icon.ttf";

    private static Typeface fontIconTypeface;

    public FontIconButton(Context context) {
        super(context);
        setTypeface(getFontIconTypeface(context, FONT_ICON_TTF));
        // 使用自定义的背景，默认的背景在这里不适合
        setBackgroundResource(R.drawable.image_button_background);
    }

    public FontIconButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        setTypeface(getFontIconTypeface(context, FONT_ICON_TTF));
        setBackgroundResource(R.drawable.image_button_background);
    }

    public FontIconButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        setTypeface(getFontIconTypeface(context, FONT_ICON_TTF));
        setBackgroundResource(R.drawable.image_button_background);
    }

    // 从assets目录中读取字体文件
    public static Typeface getFontIconTypeface(Context context, String typeface) {
        if (fontIconTypeface == null) {
            fontIconTypeface = Typeface.createFromAsset(context.getAssets(), typeface);
        }
        return fontIconTypeface;
    }
}
{% endhighlight %}  
代码很简单，这里我使用了一个自定义的背景，可以根据按钮的状态来调整颜色。

res/drawable/image_button_background.xml  
{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_pressed="true" android:drawable="@drawable/button_background_pressed"/>
    <item android:drawable="@android:color/transparent"/>
</selector>
{% endhighlight %}

res/drawable/button_background_pressed.xml
{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android">
    <gradient
            android:angle="270"
            android:endColor="#3498db"
            android:startColor="#2980b9"/>
    <corners android:radius="2dp"/>
</shape>
{% endhighlight %}
使用FontIconButton:
{% highlight xml %}
<com.liba.android.view.FontIconButton
            android:id="@+id/action_smile"
            android:text="@string/icon_smile"
            android:textColor="@color/font_icon_color_holo_light"
            android:textSize="24sp"
            android:padding="0dp"
            android:layout_width="40dp"
            android:layout_height="40dp" />
{% endhighlight %}
这里还可以为不同状态的button设置不同的textColor，总之非常方便！  
这样一切就OK了，很简单吧！
还有一点，如果想要图标能旋转，则要为图标设置旋转动画，旋转的xml如下：  
res/anim/rotate.xml
{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<set xmlns:android="http://schemas.android.com/apk/res/android"
    android:interpolator="@android:anim/linear_interpolator">
    <rotate
        android:fromDegrees="0"
        android:toDegrees="360"
        android:repeatCount="-1"
        android:pivotX="50%"
        android:pivotY="50%"
        android:duration="1000"/>
</set>
{% endhighlight %}

* 其中fromDegress设置动画开始的角度
* toDegress设置单次动画结束的角度
* repeatCount=-1则说明动画为无限循环
* pivotX和pivotY是设置动画旋转的圆心，这里都设置为50%，即为围绕图标的中心旋转
* duration是设置单次动画的时间，单位ms

再将旋转动画加到button上：
{% highlight java %}
Animation animation = AnimationUtils.loadAnimation(this, R.anim.rotate);
button.startAnimation(animation);
{% endhighlight %}
