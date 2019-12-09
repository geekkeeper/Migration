# Liquibase Maven Plugin Document

  Maven插件封装了Liquibase的一些功能，功能如下：

## 一、Liquibase Maven 插件功能

### liquibase:help

- 功能：帮助
- 说明：在liquibase-maven-plugin上显示帮助信息。
- 调用：mvn liquibase:help -Ddetail=true -Dgoal=<goal-name> 

### liquibase:changelogSync

- 功能：**更改日志同步**
- 说明：将所有未应用到数据库的更改标记为应用到更改日志中。

### liquibase:changelogSyncSQL

- 功能：更改日志同步SQL
- 说明：生成SQL，将所有未应用的更改标记为已应用。

### liquibase:clearCheckSums

- 功能：清理校验和
- 说明：  清除当前更改日志中的所有校验和，因此将重新计算它们的下一个更新。

### liquibase:dbDoc

- 功能：数据库文档
- 说明：  根据数据库生成数据库文档。

### liquibase:diff

- 功能：差异
- 说明：  生成指定数据库和引用数据库之间的差异。根据diffchangelogfile参数的值，输出可以是报告，也可以是更改日志。

### liquibase:dropAll

- 功能：删除所有
- 说明：  删除已配置模式中的所有数据库对象。注意：函数、过程和包不会被删除。

### liquibase:futureRollbackSQL

- 功能：未来的回滚SQL
- 说明：  生成在下一次更新后将数据库回滚到当前状态所需的SQL。

### liquibase:generateChangeLog

- 功能：生产变更日志
- 说明：  生成SQL，将所有未应用的更改标记为已应用。

### liquibase:listLocks

- 功能：更新锁列表
- 说明：列出当前数据库上的所有Liquibase更新锁。

### liquibase:releaseLocks

- 功能：释放锁
- 说明：Removes any Liquibase updater locks from the current database.移除当前数据库所有更新锁。 

### liquibase:rollback

- 功能：回滚
- 说明：调用数据库上的Liquibase回滚。

### liquibase:rollbackSQL

- 功能：回滚SQL
- 说明：生成将数据库回滚到指定指向属性“rollbackCount”、“rollbackTag”所需的SQL。

### liquibase:status

- 功能：状态
- 说明：打印需要应用到数据库的更改集。  

### liquibase:tag

- 功能：标签
- 说明：将一个Liquibase标记写入数据库。

### liquibase:update

- 功能：更新
- 说明：将DatabaseChangeLogs应用于数据库。作为构建过程的一部分非常有用。

### liquibase:updateSQL

- 功能：更新SQL
- 说明：生成将数据库更新为DatabaseChangeLogs中指定的当前版本所需的SQL。

### liquibase:migrate

- 功能：迁移
- 说明：**弃用。**而是使用**LiquibaseUpdate**类或Maven目标'**update**'。

### liquibase:migrateSQL

- 功能：迁移SQL
- 说明：**弃用。**使用**LiquibaseUpdateSQL**或Maven目标“**updateSQL**”。

### liquibase:updateTestingRollback

- 功能：更新测试回滚
- 说明：将DatabaseChangeLogs应用于数据库，测试回滚。这是通过更新数据库、回滚然后再次更新来完成的。

## 二、Liquibase Standard Commands（标准命令）

### （一）update（更新）

#### 1.1 update

- 功能：
- 说明：更新数据库到当前版本

#### 1.2 updateSQL

- 功能：
- 说明：将数据库更新到当前版本的SQL(标准输出)

#### 1.3 updateCount <NUM>

- 功能：
- 说明：将下一个<NUM>更改应用到数据库

#### 1.4 updateCountSQL <NUM>

- 功能：
- 说明：将下一个<NUM>更改应用到数据库写入SQL

#### 1.5 updateToTag <tag> 

- 功能：
- 说明：使用指定的标记将数据库更新到更改集

#### 1.6 updateToTagSQL <tag> 

- 功能：
- 说明：使用指定的标记将要更新到更改集的SQL写入(标准输出)

### （二）rollback（回滚）

#### 2.1 rollback <tag> 

- 功能：
- 说明:将数据库回滚到应用标记时的状态

#### 2.2 rollbackSQL <tag> 

- 功能：
- 说明:将数据库回滚到应用标记时的状态输出到SQL

#### 2.3 rollbackToDate  <date/time>

- 功能：
- 说明:将数据库回滚到给定日期/时间的状态。日期格式:yyyy-MM-dd 'HH: mm: ss

#### 2.4 rollbackToDateSQL <date/time>

- 功能：
- 说明:将数据库回滚到给定日期/时间的状态输出到SQL。日期格式:yyyy-MM-dd 'HH: mm: ss

#### 2.5 rollbackCount <value> 

- 功能：
- 说明:回滚应用于数据库的最后一个<value>更改集

#### 2.6 rollbackCountSQL <value> 

- 功能：
- 说明:将回滚应用于数据库的最后一个<value>更改集输出SQL

#### 2.7 futureRollbackSQL

- 功能：
- 说明:写入SQL，以在更改日志中的更改应用后将数据库回滚到当前状态

#### 2.8 futureRollbackSQL <value> 

- 功能：
- 说明:写入SQL，以在changeslog中的<value>更改应用后将数据库回滚到当前状态

#### 2.9 futureRollbackFromTagSQL <tag>

- 功能：
- 说明:写入(标准输出)SQL，以便在应用指定标记之前的更改后将数据库回滚到当前状态

#### 2.10 updateTestingRollback

- 功能：
- 说明:更新数据库，然后在再次更新之前回滚更改。对于测试回滚支持非常有用

### （三）Output（输出）

#### 3.1 generateChangeLog

- 功能：
- 说明：写入更改日志XML，将数据库的当前状态复制到标准输出

#### 3.2 snapshot

- 功能：
- 说明：将数据库的当前状态写入标准输出

#### 3.3 snapshotReference

- 功能：
- 说明：将referenceUrl数据库的当前状态写入标准输出

#### 3.4 dbDoc <outputDirectory>  

- 功能：
- 说明：基于当前数据库和更改日志生成类似javadoc的文档

## 三、Liquibase Diff Commands（差异命令）

#### 3.1 diff [diff parameters] 

- 说明：将差异的描述写入SQL(标准输出)
- 参数： [diff parameters] 
- 示例：

#### 3.2 diffChangeLog [diff parameters]

- 说明：将更改日志XML写入参考数据库，以将数据库更新为标准输出
- 参数：
- 示例：

## 四、LIquibase Maintenance Commands（维护命令）

#### 4.1 tag <tag string>  

- 说明：“标记”当前数据库状态以备将来回滚
- 参数：
- 示例：

#### 4.2 tagExists <tag string> 

- 说明：检查给定标记是否已经存在
- 参数：
- 示例：

#### 4.3 status [--verbose]  

- 说明：未运行的更改集的输出计数(如果存在--信息)
- 参数：
- 示例：

#### 4.4 unexpectedChangeSets [--verbose]

- 说明：在数据库中运行的不存在于变更日志中的变更集的输出计数(如果存在--信息)。
- 参数：
- 示例：

#### 4.5 validate 

- 说明：检查变更日志是否有错误
- 参数：
- 示例：

#### 4.6 calculateCheckSum <id> 

- 说明：以filepath::id::author:格式计算并打印带有给定id的变更集的校验和。
- 参数：
- 示例：

#### 4.7 clearCheckSums

- 说明：从数据库日志中删除所有保存的校验和。用于“MD5Sum检查失败”错误
- 参数：
- 示例：

#### 4.8 changelogSync

- 说明：数据库中执行的所有更改
- 参数：
- 示例：

#### 4.9 changelogSyncSQL

- 说明：将数据库中执行的所有更改写入SQL（标准输出）
- 参数：
- 示例：

#### 4.10 markNextChangeSetRan

- 说明：标记数据库中执行的下一个更改
- 参数：
- 示例：

#### 4.11 markNextChangeSetRanSQL

- 说明：将数据库中执行的下一个更改标记写入SQL（标准输出）
- 参数：
- 示例：

#### 4.12 listLocks

- 说明：列出当前在数据库changelog上拥有锁的用户
- 参数：无
- 示例：

#### 4.13 releaseLocks

- 说明：释放数据库上所有的更改锁
- 参数：无
- 示例：

#### 4.14 dropAll

- 说明：删除用户拥有的所有数据库对象
- 参数：无
- 示例：

## 五、Liquibase Command Parameters（命令参数）

### （一）Required Parameters（必须参数）：

| 参数                                |              | 说明          |
| ----------------------------------- | ------------ | ------------- |
| --changeLogFile=<path and filename> | 变更日志文件 | 迁移文件      |
| --username=<value>                  | 用户名       | 数据库-用户名 |
| --password=<value>                  | 密码         | 数据库-密码   |
| --url=<value>                       | URL          | 数据库-URL    |

### （二）Optional Parameters（可选参数）

| 参数                                                         | 功能                    | 说明                                                         |
| ------------------------------------------------------------ | ----------------------- | ------------------------------------------------------------ |
| --classpath=<value>                                          |                         | 包含迁移文件和JDBC驱动程序的类路径                           |
| --driver=<jdbc.driver.ClassName>                             | 数据库驱动              | 数据库驱动程序类名                                           |
| --databaseClass=<database.ClassName>                         | 数据库对象              | 自定义liquibase.database。要使用的数据库实现                 |
| --propertyProviderClass=<properties.ClassName>               | 属性提供类              | 要使用的自定义属性实现                                       |
| --defaultSchemaName=<name>                                   | 默认模式名称            | 用不同的数据库模式覆盖默认模式名(由RDBMS返回)                |
| --contexts=<value>                                           | 上下文                  | 要执行的更改集上下文                                         |
| --labels=<expression>                                        | 标签集                  | 定义要执行的标记为ChangeSet的表达式                          |
| --defaultsFile=</path/to/file.properties>                    | 默认配置文件            | 带有默认选项值的文件(默认:./liquibase.properties)            |
| --delimiter=<string>                                         | 分割符                  | 与 executeSql命令一起使用，设置用于分解由多个语句组成的文件的字符串。 |
| --driverPropertiesFile=</path/to/file.properties>            | 驱动属性文件            | 在要创建的JDBC连接上设置自定义属性的文件                     |
| --changeExecListenerClass=<ChangeExecListener.ClassName>     |                         | 要使用的自定义更改Exec侦听器实现                             |
| --changeExecListenerPropertiesFile=</path/to/file.properties> |                         | 自定义更改执行侦听器属性文件                                 |
| --liquibaseCatalogName=<name>                                |                         | 带有liquibase表的目录的名称                                  |
| --liquibaseSchemaName=<name>                                 |                         | 带有liquibase表的模式的名称                                  |
| --databaseChangeLogTableName=<name>                          | 数据库变更日志表-表名   | Liquibase ChangeLog表的名称(默认:DATABASECHANGELOG)          |
| --databaseChangeLogLockTableName=<name>                      | 数据库变更日志锁表-表名 | Liquibase ChangeLog锁表的名称(默认:DATABASECHANGELOGLOCK)    |
| --databaseChangeLogTablespaceName=<name>                     | 数据库变更日志表空间名  | 将要创建DATABASECHANGELOG和-LOCK表的表空间的名称(如果它们还不存在) |
| --includeSystemClasspath=<true or false>                     | 包含系统路径            | 在Liquibase类路径中包含系统类路径(默认:true)                 |
| --overwriteOutputFile=true                                   | 覆盖输出文件            | 强制覆盖生成的更改日志/SQL文件                               |
| --promptForNonLocalDatabase=<true or false>                  | 提示非本地数据库        | 非本地主机数据库提示符(默认:false)                           |
| --logLevel=<level>                                           | 日志级别                | 指定日志级别                                                 |
| --logFile=<file>                                             | 日志文件                | 指定日志文件                                                 |
| --currentDateTimeFunction=<value>                            | 获取当前时间函数        | 重写SQL中使用的当前日期时间函数。对于不支持的数据库非常有用  |
| --outputDefaultSchema=<true or false>                        | 默认输出数据库模式      | 如果为真，则SQL对象引用包括模式名，即使它是默认模式。默认值为true |
| --outputDefaultCatalog=<true or false>                       | 输出默认数据库编目      | 如果为真，则SQL对象引用包括编目名称，即使它是默认的编目。默认值为true |
| --outputFile=<file>                                          | 指定输出文件目录        | 将输出写入命令的文件，例如updateSQL。如果没有指定，则写入sysout。 |
| --help                                                       | 帮助                    | 打印此消息                                                   |
| --version                                                    | 版本                    | 打印此版本信息                                               |

### （三）Required Diff Parameters（获取差异必要参数）

| 参数                        | 功能             | 说明                                         |
| --------------------------- | ---------------- | -------------------------------------------- |
| --referenceUsername=<value> | 参考数据库用户名 | 参考数据库用户名                             |
| --referencePassword=<value> | 参考数据库密码   | 如果<value>是"提示", Liquibase将提示输入密码 |
| --referenceUrl=<value>      | 参考数据库URL    | 参考数据库URL                                |

### （四）Optional Diff Parameters（获取差异可选参数）

#### --defaultCatalogName=<name>

- 功能：默认目录名称
- 说明：目标数据库默认编目

####  --defaultSchemaName=<name>

- 功能：默认模式名称
- 说明：目标数据库默认模式

####  --referenceDefaultCatalogName=<name> 

- 功能：参考数据库默认编目名称
- 说明：参考数据库默认编目名称

####  --referenceDefaultSchemaName=<name> 

- 功能：参考数据库默认模式名称
- 说明：参考数据库默认模式名称

####  --schemas=<name1,name2> 

- 功能：模式列表
- 说明：数据库模式以包含来自比较的对象 

####  --referenceSchemas=<name1,name2> 

- 功能：参考数据库模式列表
- 说明：参考数据库模式包含来自<name1,name2>的对象，只在与模式不同时才需要。

####  --outputSchemaAs=<name1,name2>

- 功能：输出模式列表
- 说明：在diffChangeLog/generateChangeLog上，使用这些名称作为schemaName，而不是实名。

####  --includeCatalog=<true or false>

- 功能：是否包含编目
- 说明：如果为真，编目将包含在生成的变更集中，默认为假 

####  --includeSchema=<true or false> 

- 功能：是否包含模式
- 说明：如果为真，模式将包含在生成的变更集中，默认为假

####  --includeTablespace=<true or false> 

- 功能：是否包含表空间
- 说明：如果为真，表和索引的表空间将包含在生成的变更集中。默认值为假

####  --referenceDriver=<jdbc.driver.ClassName> 

- 功能：参考数据库驱动
- 说明：引用数据库驱动程序类名

####  --dataOutputDirectory=DIR 

- 功能：数据输出目录
- 说明：在给定目录中以CSV格式输出数据

####  --diffTypes

- 功能：不同类型
- 说明：在变更日志中包含的不同类型列表，以逗号分隔的列表形式表示，这些列表来自:表、视图、列、索引、外键、主键、惟一约束数据。如果该值为空，那么默认类型为:表、视图、列、索引、外键、主键、唯一约束。 



## 迁移存在的问题

1. 数据类型：varchar（max）

2. 函数：convert（）、CASE（）、LEN（）、 xml   path（‘’）==GROUP_CONCAT、stuff()==insert()需要加as、COUNT（0）

3. 模式（）：dbo.
4. 关键字：desc--description(t_deply、t_clctr、t_tag)
5. 索引：clustered（mysql不支持聚集索引）、
6. 字段不能为空（默认值为‘’）