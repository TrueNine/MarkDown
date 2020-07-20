# SSM 简单整合

>   只是对整合流程进行简单概括,并非对所有流程进行详细说明
>
>   其中有些步骤并非必要,标题会以 ~~删除线~~ 进行标记
>
>   ```mermaid
>   graph TD;
>   需求分析 
>   	--> 设计
>   	--> 设计数据库
>   		--> 设计业务
>   		--> 设计前端页面
>   ```

## maven 配置

>   其中 lombok 和 log4j 非必要

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.truenine</groupId>
    <artifactId>truenine</artifactId>
    <version>1.0</version>

    <packaging>war</packaging>

    <dependencies>
        <!--junit-->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13</version>
            <scope>test</scope>
        </dependency>
        <!--log4j-->
        <dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>1.2.17</version>
        </dependency>
        <!--lombok-->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.18.12</version>
        </dependency>
        <!--数据库相关-->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.49</version>
        </dependency>
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis</artifactId>
            <version>3.5.5</version>
        </dependency>
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis-spring</artifactId>
            <version>2.0.5</version>
        </dependency>
        <dependency>
            <groupId>com.mchange</groupId>
            <artifactId>c3p0</artifactId>
            <version>0.9.5.5</version>
        </dependency>
        <!--spring相关-->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>5.2.7.RELEASE</version>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-jdbc</artifactId>
            <version>5.2.7.RELEASE</version>
        </dependency>
        <!--servlet相关-->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>servlet-api</artifactId>
            <version>2.5</version>
        </dependency>
        <!--此处直接包含jsp-->
        <dependency>
            <groupId>javax.servlet.jsp.jstl</groupId>
            <artifactId>jstl-api</artifactId>
            <version>1.2</version>
        </dependency>
        <dependency>
            <groupId>javax.el</groupId>
            <artifactId>el-api</artifactId>
            <version>2.2</version>
        </dependency>
        <dependency>
            <groupId>org.apache.taglibs</groupId>
            <artifactId>taglibs-standard-jstlel</artifactId>
            <version>1.2.5</version>
        </dependency>
    </dependencies>

    <build>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <includes>
                    <include>**/*.properties</include>
                    <include>**/*.xml</include>
                </includes>
                <filtering>true</filtering>
            </resource>
            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/*.properties</include>
                    <include>**/*.xml</include>
                </includes>
                <filtering>true</filtering>
            </resource>
        </resources>

        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>8</source>
                    <target>8</target>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>
```

# 整合 Mybatis

>   mybatis的主要作用为持久层框架,负责与数据库进行交互

## 建立数据库/表格

>   建立完成后连接并测试

```sql
CREATE DATABASE `ssmbuild`;
USE `ssmbuild`;
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books`
(
    `bookID`     INT(10)      NOT NULL AUTO_INCREMENT COMMENT '书本id',
    `bookName`   VARCHAR(100) NOT NULL COMMENT '书本名称',
    `bookCounts` INT(11)      NOT NULL COMMENT '书本数量',
    `detail`     VARCHAR(200) NOT NULL COMMENT '书本详情',
    KEY `books` (`bookID`)
) ENGINE = INNODB
  DEFAULT CHARSET = utf8;
INSERT INTO `ssmbuild`.books(bookID, bookName, bookCounts, detail)
VALUES (1, 'java', 1, '从入门到放弃'),
       (2, 'MySQL', 10, '从删库到跑路'),
       (3, 'Linux', 5, '从进门到进牢');
```

## 编写 数据库链接所需的 properties

```properties
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/ssmbuild?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
jdbc.username=root
jdbc.password=root
```

## 其他

1.  为表编写对应的 Mapper 类
2.  创建 Mybatis-config.xml,~~配置日志~~,配置 mapper 类包别名,引入 mapper,**配置留由spring**

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0/EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <settings>
        <setting name="logImpl" value="LOG4J"/>
    </settings>
    <typeAliases>
        <package name="com.truenine.pojo"/>
    </typeAliases>
    <mappers>
        <mapper resource="com/truenine/mybatis/mapper/BooksMapperXML.xml"/>
    </mappers>
</configuration>
```

3.  编写 mapper 接口,在对应的 mapper,**编写对应业务SQL**

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Config 3.0/EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.truenine.dao.BooksMapper">
    <insert id="insertBooks" parameterType="books">
        <!--此处没有设置id-->
        INSERT INTO `ssmbuild`.`books`(bookName, bookCounts, detail)
        VALUES (#{bookName}, #{bookCounts}, #{detail});
    </insert>
    <update id="updateBooks" parameterType="books">
        <!--此处没有设置id-->
        UPDATE `ssmbuild`.`books`
        <set>
            <if test="bookID != null">`bookName` = #{bookName},</if>
            <if test="bookName != null">`bookCounts` = #{bookCounts},</if>
            <if test="bookCounts != null">`bookCounts` = #{bookCounts},</if>
            <if test="detail != null">`detail` = #{detail}</if>
        </set>
    </update>
    <delete id="deleteBooksById" parameterType="int">
        DELETE
        FROM `ssmbuild`.`books`
        WHERE<if test="bookID != null">`bookID` = #{bookID}</if>;
    </delete>
    <delete id="deleteBooks" parameterType="books">
        DELETE
        FROM `ssmbuild`.`books`
        WHERE `bookID` = #{bookID};
    </delete>
    <select id="selectBooks" parameterType="books" resultType="books">
        select * FROM `ssmbuild`.`books`
        <where>
            <if test="bookID != null">`bookID` = #{bookID}</if>
            <if test="bookName != null">AND `bookName` = #{bookName}</if>
        </where>
        ;
    </select>
    <select id="selectBooksById" resultType="books">
        SELECT *
        FROM `ssmbuild`.`books`
        WHERE `bookID` = #{bookID};
    </select>
    <select id="selectBooksAll" resultType="books">
        SELECT *
        FROM `ssmbuild`.`books`;
    </select>
</mapper>
```



## 无关准备

1.  编写 service 接口,并编写实体类

>   需为 Mapper 接口 **提供set方法,供 spring 托管**

```java
package com.truenine.service;

import com.truenine.dao.BooksMapper;
import com.truenine.pojo.Books;

import java.util.List;

public class BooksServiceImpl implements BooksService {

    BooksMapper booksMapper;

    @Override
    public int insertBooks(Books books) {
        return booksMapper.insertBooks(books);
    }

    @Override
    public int updateBooks(Books books) {
        return booksMapper.updateBooks(books);
    }

    @Override
    public int deleteBooks(Books books) {
        return booksMapper.deleteBooks(books);
    }

    @Override
    public int deleteBooksById(Integer bookId) {
        return booksMapper.deleteBooksById(bookId);
    }

    @Override
    public Books selectBooks(Books books) {
        return booksMapper.selectBooks(books);
    }

    @Override
    public Books selectBooksById(Integer booksId) {
        return booksMapper.selectBooksById(booksId);
    }

    @Override
    public List<Books> selectBooksAll() {
        return booksMapper.selectBooksAll();
    }

    public BooksMapper getBooksMapper() {
        return booksMapper;
    }

    public void setBooksMapper(BooksMapper booksMapper) {
        this.booksMapper = booksMapper;
    }
}
```



>   综上 mybatis 层的东西已经配置完毕,其他交给 spring "托管" 即可

# 整合Spring

## 关联持久层

>   托管: 数据库,连接池,SqlSessionFactory

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context
                           http://www.springframework.org/schema/context/spring-context.xsd">
    <!--读取properties文件信息-->
    <context:property-placeholder location="classpath:database.properties"/>
    <!--数据源配置-->
    <bean id="dataSource"
          class="com.mchange.v2.c3p0.ComboPooledDataSource">
        <property name="driverClass" value="${jdbc.driver}"/>
        <property name="jdbcUrl" value="${jdbc.url}"/>
        <property name="user" value="${jdbc.username}"/>
        <property name="password" value="${jdbc.username}"/>

        <!--c3p0独有属性配置-->

        <property name="maxPoolSize" value="30"/>
        <property name="minPoolSize" value="10"/>
        <!--关闭连接后不自动连接-->
        <property name="autoCommitOnClose" value="false"/>
        <!--获取连接超时时间-->
        <property name="checkoutTimeout" value="10000"/>
        <!--连接失败重试次数-->
        <property name="acquireRetryAttempts" value="2"/>
    </bean>
    <!--SqlSessionFactory-->
    <bean id="sqlSessionFactoryBean"
          class="org.mybatis.spring.SqlSessionFactoryBean">
        <!--绑定数据源-->
        <property name="dataSource" ref="dataSource"/>
        <property name="configLocation" value="classpath:com/truenine/mybatis/mybatis-config.xml"/>
    </bean>

    <!--配置 dao 接口扫描包-->
    <bean id="configurer"
          class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <!--注入 SqlSessionFactoryBeanName-->
        <property name="sqlSessionFactoryBeanName" value="sqlSessionFactoryBean"/>
        <!--扫描 dao 包-->
        <property name="basePackage" value="com.truenine.dao"/>
    </bean>
</beans>
```

## 托管 Service,并声明事务

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context
                           http://www.springframework.org/schema/context/spring-context.xsd">

    <!--此处引入数据源-->
    <import resource="classpath:com/truenine/spring/dao/spring-dao.xml"/>
    <!--扫描 service包 -->
    <context:component-scan base-package="com.truenine.service"/>
    <!--将所有业务类注入 mapper实现类 -->
    <bean id="bookServiceImpl" class="com.truenine.service.BooksServiceImpl">
        <property name="booksMapper" ref="booksMapper"/>
    </bean>

    <!--声明式事务,此处可选 aop -->
    <bean id="manager"
          class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <!--注入数据源-->
        <property name="dataSource" ref="dataSource"/>
    </bean>
</beans>
```

>   被扫描的Service实现类
>
>   ```java
>   package com.truenine.service;
>   
>   import com.truenine.dao.BooksMapper;
>   import com.truenine.pojo.Books;
>   
>   import java.util.List;
>   
>   public class BooksServiceImpl implements BooksService {
>   
>       BooksMapper booksMapper;
>   
>       @Override
>       public int insertBooks(Books books) {
>           return booksMapper.insertBooks(books);
>       }
>   
>       @Override
>       public int updateBooks(Books books) {
>           return booksMapper.updateBooks(books);
>       }
>   
>       @Override
>       public int deleteBooks(Books books) {
>           return booksMapper.deleteBooks(books);
>       }
>   
>       @Override
>       public int deleteBooksById(Integer bookId) {
>           return booksMapper.deleteBooksById(bookId);
>       }
>   
>       @Override
>       public Books selectBooks(Books books) {
>           return booksMapper.selectBooks(books);
>       }
>   
>       @Override
>       public Books selectBooksById(Integer booksId) {
>           return booksMapper.selectBooksById(booksId);
>       }
>   
>       @Override
>       public List<Books> selectBooksAll() {
>           return booksMapper.selectBooksAll();
>       }
>   
>       public BooksMapper getBooksMapper() {
>           return booksMapper;
>       }
>   
>       public void setBooksMapper(BooksMapper booksMapper) {
>           this.booksMapper = booksMapper;
>       }
>   }
>   ```

# 整合 SpringMVC

>   使用工具为 idea

## 为Module添加 web 支持

![image-20200716094225655](../img/SSM%E7%AE%80%E5%8D%95%E6%95%B4%E5%90%88/image-20200716094225655.png)

## 配置 web.xml

>   DispatcherServlet 配置参数,并随servlet一并启动,**配置托管全请求 ==为 /==???**
>
>   ​		此处spring配置文件的classpath,**必须是托管所有bean后的配置文件**
>
>   配置编码过滤器,格式为给定的 utf-8,**此处为过滤==/*==**
>
>   配置 Session 过期时间
>
>   ```xml
>   <?xml version="1.0" encoding="UTF-8"?>
>   <web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
>            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
>            xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
>            version="4.0">
>       <servlet>
>           <servlet-name>springmvc</servlet-name>
>           <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
>           <init-param>
>               <param-name>contextConfigLocation</param-name>
>               <param-value>classpath:com/truenine/spring/ApplicationContext.xml</param-value>
>           </init-param>
>           <load-on-startup>1</load-on-startup>
>       </servlet>
>       <servlet-mapping>
>           <servlet-name>springmvc</servlet-name>
>           <url-pattern>/</url-pattern>
>       </servlet-mapping>
>       <!--编码过滤器-->
>       <filter>
>           <filter-name>springmvc-encoding-Filter</filter-name>
>           <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
>           <init-param>
>               <param-name>encoding</param-name>
>               <param-value>UTF-8</param-value>
>           </init-param>
>       </filter>
>       <filter-mapping>
>           <filter-name>springmvc-encoding-Filter</filter-name>
>           <url-pattern>/*</url-pattern>
>       </filter-mapping>
>       <!--配置 Session 过期时间-->
>       <session-config>
>           <session-timeout>15</session-timeout>
>       </session-config>
>   </web-app>
>   ```

## 配置 SpringMVC 配置文件

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/mvc
                           http://www.springframework.org/schema/mvc/spring-mvc.xsd
                           http://www.springframework.org/schema/context
                           https://www.springframework.org/schema/context/spring-context.xsd">
    <!--使用注解驱动-->
    <mvc:annotation-driven/>
    <!--静态资源过滤-->
    <mvc:default-servlet-handler/>
    <!--扫描包-->
    <context:component-scan base-package="com.truenine.controller"/>
    <!--视图解析器-->
    <bean id="internalResourceViewResolver"
          class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/jsp/"/>
        <property name="suffix" value=".jsp"/>
    </bean>
</beans>
```

## 托管所有文件

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!--关联所有文件-->
    <import resource="classpath:com/truenine/spring/dao/spring-dao.xml"/>
    <import resource="classpath:com/truenine/spring/service/spring-service.xml"/>
    <import resource="classpath:com/truenine/spring/mvc/controller/springmvc-servlet.xml"/>
</beans>
```

## 编写 Controller

```java
package com.truenine.controller;

import com.truenine.pojo.Books;
import com.truenine.service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/books")
public class BooksController {

    @Autowired
    @Qualifier("bookServiceImpl")
    private BooksService booksService;

    @RequestMapping("/allBook")
    public String list(Model model) {
        List<Books> books = booksService.selectBooksAll();
        model.addAttribute("list", books);
        return "allBook";
    }
}
```

## 进行测试

.......

# 业务模拟

>   Service 聚合 Mapper,并使用 spring 进行注入

## 查询模拟

1.  托管所有Service实现类,并注入Mapper

```xml
<!--将所有业务类注入 mapper实现类 -->
<bean id="bookServiceImpl" class="com.truenine.service.BooksServiceImpl">
    <property name="booksMapper" ref="booksMapper"/>
</bean>
```

2.  Service 实现类

```java
package com.truenine.service;

import com.truenine.dao.BooksMapper;
import com.truenine.pojo.Books;

import java.util.List;

public class BooksServiceImpl implements BooksService {

    BooksMapper booksMapper;

    @Override
    public int insertBooks(Books books) {
        return booksMapper.insertBooks(books);
    }

    @Override
    public int updateBooks(Books books) {
        return booksMapper.updateBooks(books);
    }

    @Override
    public int deleteBooks(Books books) {
        return booksMapper.deleteBooks(books);
    }

    @Override
    public int deleteBooksById(Integer bookId) {
        return booksMapper.deleteBooksById(bookId);
    }

    @Override
    public Books selectBooks(Books books) {
        return booksMapper.selectBooks(books);
    }

    @Override
    public Books selectBooksById(Integer booksId) {
        return booksMapper.selectBooksById(booksId);
    }

    @Override
    public List<Books> selectBooksAll() {
        return booksMapper.selectBooksAll();
    }

    public BooksMapper getBooksMapper() {
        return booksMapper;
    }

    public void setBooksMapper(BooksMapper booksMapper) {
        this.booksMapper = booksMapper;
    }
}
```

