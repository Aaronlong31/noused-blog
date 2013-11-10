---
layout: post
title: "Android: Set states for TextView"
description: "Use color selector"
category: articles
tags: [Android]
image:
  credit: aegean
  creditlink: http://stackoverflow.com/a/18631745
comments: true
---
1. Define your color selector under res/color;
2. Set this color selector to your TextView as `android:textColor="@color/m_text_selector"`

>Note: If you want to set textColor selector programmatically, you must get your selector as color state list not as a color;
> `textView.setTextColor(getResources().getColorStateList(R.color.m_text_selector));`
