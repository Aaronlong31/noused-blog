---
layout: post
title: spring的 PropertyPlaceholderConfigurer配置
wordpress_id: 161
wordpress_url: http://192.168.13.105/?p=161
categories:
- spring
tags:
- spring
---
在使用spring时，经常要用到各种properties的配置文件，并且各个环境下的文件还不一样，因此要使用动态加载不通环境下的配置文件。下面来说一下如何进行配置。<!--more-->在spring的住配置文件applicationContext.xml中使用一下配置：[xml]&lt;bean class=&quot;org.springframework.beans.factory.config.PropertyPlaceholderConfigurer&quot;&gt;      &lt;property name=&quot;systemPropertiesModeName&quot; value=&quot;SYSTEM_PROPERTIES_MODE_OVERRIDE&quot; /&gt;      &lt;property name=&quot;ignoreResourceNotFound&quot; value=&quot;true&quot; /&gt;      &lt;property name=&quot;locations&quot;&gt;          &lt;list&gt;              &lt;!-- 标准配置 --&gt;              &lt;value&gt;classpath:jdbc.properties&lt;/value&gt;              &lt;!-- 本机测试环境 --&gt;              &lt;value&gt;file:d:/jdbc.properties&lt;/value&gt;              &lt;!-- 服务器生产环境配置 --&gt;              &lt;value&gt;file:/usr/local/jdbc.properties&lt;/value&gt;          &lt;/list&gt;      &lt;/property&gt;  &lt;/bean&gt;  [/xml]我在这里配置了三个环境的配置文件，有的文件可能找不到，所以将ignoreResourceNotFound属性设为true，这样就可以忽略找不到的文件。最后配置的属性会覆盖之前配置的属性，就是说，如果classpath下存在jdbc.properties，目录/usr/local/jdbc.properties下也存在，后面的会替换前面的。spring3.0后可以使用简化配置：不过不能忽略找不到的文件[xml]&lt;context:property-placeholder            location=&quot;file:d:/emoe/jdbc.properties,classpath:jdbc.properties,file:/usr/local/jdbc.properties&quot; /&gt;  [/xml]
