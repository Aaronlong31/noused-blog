---
layout: post
title: "Solr查询语法"
description: "Solr的一些常用查询参数"
category:
tags: [solr]
---
{% include JB/setup %}

参数说明
#####q:主要的查询参数
```
q=str
q=text:str
q=text:str AND id:1
q=postTime:[2013-03-06T23:59:59.999Z TO *]
```
#####fl:指定返回的field
```
fl=id,text
```
#####wt:返回的数据格式
```
wt=json
wt=xml
```
#####start:从多少条开始返回
```
start=0
```
#####rows:共返回多少条
```
rows=10
```
#####sort:指定排序方式
```
sort=id desc
sort=postTime asc
```
#####fq:filter query,过滤id为1的结果,大写的`AND`是与,小写的`and`是或
```
fq=id:1
fq=forumId:23 and fq=forumId:13 // 过滤forumId为23或12的
fq=forumId:13 AND postTime:[2013-07-11T23:59:59.999Z TO 2013-07-12T23:59:59.999Z]//过滤forumId为13且发帖时间在指定时间内的
fq=topicId:[7000000  TO 7000010]
```
***
###[highlight][6]参数
#####hl:设置为true时开启高亮
```
hl=true
```
#####hl.fl:高亮的field
```
hl.field=title,content
```
#####hl.simple.pre:高亮前缀
```
hl.simple.pre=<em>
```
#####hl.simple.post:高亮后缀
```
hl.simple.post=</em>
```
#####hl.fragsize:高亮片段的长度
```
hl.fragsize=100
```
***
###[group][5]参数
#####group:设置为true时开启分组
```
group=true
```
#####group.field:用来分组的field
```
group.field=topicId
```
#####group.limit:组内分页用,默认1
#####group.offset:组内分页用,默认0
#####group.sort:组内排序用,默认和sort参数一样
***
###[dismax][4]参数
>**需要设置`defType=dismax`**

这些参数都会影响用于排序的score. 
#####bf
```
recip(ms(NOW/HOUR,postTime),3.16e-11,1,1)//postTime越大,score越大
```
#####pf
```
title^4 content^3
```
#####qf
```
title^2 content^1
```
`pf=title^4 content^3&qf=title^2 content^1`的意思是,title中全词匹配的比重 > content中的全词匹配的比重 > title中分词匹配的比重 > content中分词匹配的比重
>
```
q={!frange l= 1}query($qq)&qq=李天一
```

[1]: http://wiki.apache.org/solr/FieldCollapsing
[2]: http://wiki.apache.org/solr/SolrQuerySyntax
[3]: http://wiki.apache.org/solr/FunctionQuery
[4]: http://wiki.apache.org/solr/DisMaxQParserPlugin
[5]: https://cwiki.apache.org/confluence/display/solr/Result+Grouping "Result+Group"
[6]: https://cwiki.apache.org/confluence/display/solr/Highlighting "Highlighting"

> Written with [StackEdit](http://benweet.github.io/stackedit/).