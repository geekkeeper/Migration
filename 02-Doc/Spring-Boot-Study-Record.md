# Spring Boot 学习笔记

## 一、环境搭建

### （一）安装及配置JDK

### （二）安装及配置Maven

### （三）安装及配置IDE

### （四）熟悉Spring boot 工程结构

## 二、Spring Boot Web

### （一）Web

### （二）WebFlux

### （三）热部署

### （四）配置文件及自定义属性

- 配置文件类型

  application.properties

  ```properties
  server.port=8888
  ```

  application.yml

  ```yml
  server: 
  	port: 8888
  ```

  `注意：yml 属性名称冒号(:)后加空格`

- 多配置文件

- 自定义配置文件

- 自定义属性

  ```properties
  book.name=实战之旅
  book.author=王勋
  ```

  `注意：属性值的编码格式（建议使用Unicode编码）`

  ```properties
  # 实战之旅
  book.name=&#23454;&#25112;&#20043;&#26053;
  # 王勋
  book.author=&#29579;&#21195;
  ```

  自定义属性的使用：

  ```java
  @RestController
  public class BookController {
      @Value("${book.name}")
      private String bookName;
      @Value("${book.author}")
      private String bookAuthor;
  
      @GetMapping("/getbookinfo")
      public String getBookInfo(){
          return "书名:"+bookName+" 作者:"+bookAuthor;
      }
  }
  ```

  随机数的使用：

  ```properties
  # Spring Boot 实战之旅
  book.name=&#83;&#112;&#114;&#105;&#110;&#103;&#32;&#66;&#111;&#111;&#116;&#32;&#23454;&#25112;&#20043;&#26053;
  # 王勋
  book.author=&#29579;&#21195;
  # 随机字符串
  book.value=${random.value}
  # 随机整形
  book.intValue=${random.int}
  # 随机长整形
  book.longValue=${random.long}
  # 随机UUID
  book.uuid=${random.uuid}
  # 1000以内随机整数
  book.randomInt=${random.int(1000)}
  book.randomLong=${random.long(1000)}
  # 属性间引用
  book.title=${book.name}
  ```

  

### （五）使用页面模板

#### Thymeleaf

1. 添加依赖

   ```xml
   <dependencies>
   		<!--去除HTML严格校验-->
   		<dependency>
   			<groupId>net.sourceforge.nekohtml</groupId>
   			<artifactId>nekohtml</artifactId>
   			<version>1.9.22</version>
   		</dependency>
   		<!--thymeleaf模板-->
   		<dependency>
   			<groupId>org.springframework.boot</groupId>
   			<artifactId>spring-boot-starter-thymeleaf</artifactId>
   		</dependency>
   		<dependency>
   			<groupId>org.springframework.boot</groupId>
   			<artifactId>spring-boot-starter-web</artifactId>
   		</dependency>
   	</dependencies>
   ```

   

2. 配置

   ```properties
   # thymeleaf缓存是否开启，开发阶段建议开启
   spring.thymeleaf.cache=false
   # 设置thymeleaf编码格式
   spring.thymeleaf.encoding=UTF-8
   # 去除thymeleaf对HTML的严格校验
   spring.thymeleaf.mode=LEGACYHTML5
   # 设置thymeleaf模板文件前缀
   spring.thymeleaf.prefix=classpath:/templates/
   # 设置thymeleaf模板文件后缀
   spring.thymeleaf.suffix=.html
   ```

3. 常用语法

   ```
   th:text  							设置当前元素的文本内容
   th:value 							设置当前元素的值
   th:each  							循环遍历元素，配合上面的元素使用
   th:attr  							设置当前元素的属性
   th:if th:switch th:case th:unless  	条件判断
   th:insert th:replace th:incloud    	代码块引入
   ```

4. 内置方法

   ```
   #number 	数字方法
   #dates 		日期方法
   #calendars 	日历方法
   #string 	字符串方法
   #lists 		集合方法
   #maps 		对象方法
   ```

   

### （六）文件上传下载

## 三、Spring Boot 数据库

## 四、Spring Boot 缓存

## 五、Spring Boot 日志

## 六、Spring Boot 安全

## 七、Spring Boot 监控

## 八、Spring Boot 消息