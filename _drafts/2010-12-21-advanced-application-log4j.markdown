---
layout: post
title: log4j高级应用
wordpress_id: 336
wordpress_url: http://www.zlong.org/?p=336
categories:
- 未分类
tags: []
---
在项目中使用了log4j，需要将异常信息记录到日志文件，同时可以打印到控制台；还要将重要的操作信息记录到数据库，方便查询，但不记录到日志文件。所以这里就涉及到了对不同的信息进行不同的日志记录。以下是我的log4j.properties：[java]# root log level is warnlog4j.rootLogger=warn, &lt;span style=&quot;color: #ff0000;&quot;&gt;logfile&lt;/span&gt;, &lt;span style=&quot;color: #ff0000;&quot;&gt;stdout&lt;/span&gt;#log to consolelog4j.logger.stdout=warn, stdoutlog4j.appender.stdout.Threshold=warnlog4j.appender.stdout=org.apache.log4j.ConsoleAppenderlog4j.appender.stdout.layout=org.apache.log4j.PatternLayoutlog4j.appender.stdout.layout.ConversionPattern=%d{yyyy-MM-dd } [%p] %r [%t] %x - %m%n#log to daily rolling filelog4j.logger.logfile=warn, logfilelog4j.appender.logfile=org.apache.log4j.DailyRollingFileAppenderlog4j.appender.logfile.File=/jyams/logs/jyams.loglog4j.appender.logfile.layout=org.apache.log4j.PatternLayoutlog4j.appender.logfile.layout.ConversionPattern=%d [%t] %-5p [%c] - %m%n#log to databaselog4j.logger.JDBC=info, JDBClog4j.appender.JDBC=org.apache.log4j.jdbc.JDBCAppenderlog4j.appender.JDBC.URL=jdbc:mysql://localhost:3306/jyamslog4j.appender.JDBC.driver=com.mysql.jdbc.Driverlog4j.appender.JDBC.user=rootlog4j.appender.JDBC.password=rootlog4j.appender.JDBC.sql=INSERT INTO OperateLog (operatorId,operatorName,operateType,operateInfo,operateModule)  VALUES (%X{operatorId}, '%X{operatorName}', %X{operateType}, '%m', %X{operateModule});log4j.appender.JDBC.layout=org.apache.log4j.PatternLayoutlog4j.additivity.JDBC=false[/java]我定义了3个logger，其中logfile和stdout是root logger，在程序中调用logger有以下几种情况：1. Logger logger = LoggerFactory.getLogger(SimpleClass.class)；会将日志记录到所有的根logger中；
2. Logger logger = LoggerFactory.getLogger("stdout");这里的stdout是在配置文件中定义的根logger，就像上面的stdout和logfile；会先记录到stdout中，再记录到所有的根logger中，因此会记录3遍；
3. Logger logger = LoggerFactory.getLogger("JDBC");这里的JDBC是配置文件中定义的，但不是根Logger。
对于情况1，会将日志记录到所有根logger中；对当你在程序中使用LoggerFactory.getLogger(SimpleClass.class)时，会使用这两个root logger，当你使用LoggerFactory.getLogger("stdout")时会使用stdout这个logger，stdout就是在log4j.properties中定义的logger名称。所以当你要记录异常信息时，使用LoggerFactory.getLogger(SimpleClass.class)这样的logger；当你要记录操作信息是，就要使用LoggerFactory.getLogger("JDBC")了。这里还有一点要说明，如果你记录异常信息时使用了LoggerFactory.getLogger("stdout")，它同样会把异常信息记录到数据库中，当然由于信息不全会出错，所以为了防止这种情况发生，要使用LoggerFactory.getLogger(SimpleClass.class)，这样就只使用root logger，不使用
