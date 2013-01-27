---
layout: post
title: 文本框input的高级代码
wordpress_id: 346
wordpress_url: http://www.zlong.org/?p=346
categories:
- 未分类
tags: []
---
1、取消按钮按下时的虚线框在input里添加属性值hideFocus或者HideFocus=true2、只读文本框内容在input里添加属性值readonly3、防止退后清空的TEXT文档（可把style内容做做为类引用）&lt;input style="behavior:url(#default#savehistory);" type="text" id="oPersistInput"&gt; 4、ENTER键可以让光标移到下一个输入框&lt;input onkeydown="if(event.keyCode==13)event.keyCode=9"&gt;5、只能为中文（有闪动）&lt;input onkeyup="value=value.replace(/[ -~]/g,'')" onkeydown="if(event.keyCode==13)event.keyCode=9"&gt;6、只能为数字（有闪动）&lt;input onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"&gt;7、只能为数字（无闪动）&lt;input style="ime-mode:disabled" onkeydown="if(event.keyCode==13)event.keyCode=9" onKeyPress="if((event.keyCode&lt;48||event.keyCode&gt;57))event.returnValue=false"&gt;8、只能输入英文和数字（有闪动）&lt;input onkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"&gt;9、屏蔽输入法&lt;input type="text" name="url" style="ime-mode:disabled" onkeydown="if(event.keyCode==13)event.keyCode=9"&gt;10、只能输入数字、小数点、减号（-）、字符（无闪动）&lt;input onKeyPress="if(event.keyCode!=46&amp;&amp;event.keyCode!=45&amp;&amp;(event.keyCode&lt;48||event.keyCode&gt;57)) event.returnValue=false"&gt;11、只能输入两位整数、三位小数（有闪动）&lt;input maxlength="9" onkeyup="if(value.match(/^\d{3}$/))value=value.replace(value,parseInt(value/10));value=value.replace(/\.\d*\./g,'.')" onKeyPress="if((event.keyCode&lt;48||event.keyCode&gt;57)&amp;&amp;event.keyCode!=46&amp;&amp;event.keyCode!=45||value.match(/^\d{3}$/)||/\.\d{3}$/.test(value)){event.returnValue=false}" id="text_kfxe" name="text_kfxe"&gt;
