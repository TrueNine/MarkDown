spring boot是 spring framework 下的一个项目



# 1. Hello world 直接省略

# 2. 配置

spring 默认会使用两种配置文件：properties 和 yml(yaml)，spring都会认为是全局文件；==前提是必须是 application.==。配置文件的作用是用于修改 spring配置的默认值；

spring 在底层将所有的属性……都进行了配置，如果进行修改，则可以通过配置文件进行修改。

## YML(YAML)

*    Alin't mark up language 是一个标记语言
*   Isn't Mark up language 不是一个标记语言

以数据为中心，相同的配置，yaml 不会很冗余

```xml
<application>
  <server>
    <port>8080</port>
  </server>
</application>
```

```yaml
application:
 server:
  port: 8080
```

*   key: value
*   空格区分层级
*   大小写敏感

### 基本语法

```yml
# key value 写法
key: value

# 字符粗默认不用使用单引号或者双引号
key: this is String

# 单引号和双引号是有特殊含义的
# ”“ 不会转义特殊字符，表示后就是想表示的意思
key: "this is string\r\n\t"
# 结果为：this is string换行制表
# '' 则会输出将特殊字符转义
key: 'this is string\r\n\t'
# 结果为：this is string\r\n\t
```

### 对象语法

还是以 k: v 形式进行书写，但是以空格区分层级

```yml
key:
 obj:
  obj2: true
 list: null
 
 # 行内写法
 key: {obj: {obj2: true}, list: null}
```

### 数组

```yml
list:
 - 1
 - 2
 - 3
 - 4
 
# 行内写法
list: [1,2,3,4]
```

### 占位符

通常使用 ${} 进行获取，比如随机数

也可以获取一个已配置的值，如果没有，可以使用 ${}:默认值 指定默认值

### 文档块

使用 --- 对文件进行分割，将一个文件分割为不同的文档块

```yml
server:
 port: 8080
 
 ---
 
 server:
  port: 8081
```

## springBoot 获取值的方式

1.  @ConfigurationProperties(preffix = "前缀") 获取值，这种方式 记得添加 set get

>   这种方式有以下方式可使用
>
>   1.  ```${前缀}```
>   2.  直接书写字面量
>   3.  书写表达式 ```#{1 + 1}```

### @ConfigurationProperties & @Value

|                    | @ConfigurationProperties     | @Value       |
| ------------------ | ---------------------------- | ------------ |
| 功能               | 可以批量注入配置文件中的属性 | 只能单个指定 |
| 松散绑定           | 支持松散绑定语法             | 不支持       |
| SpEL               | 不支持                       | 支持         |
| JSR303校验         | 支持                         | 不支持       |
| 复杂类型封装（map) | 支持                         | 不支持       |

### @PropertySource

@ConfigurationProperties 默认从全局配置文件获取值，此注解用于从指定的配置文件加载

### ==向容器内添加组件==

1.  使用 @Configuration 标记一个配置类
2.  使用 @Bean 标记一个方法
3.  此方法的返回值就是 bean 的值，方法名就是 bean 本身

## Profile

spring 对不同环境功能提供的不同配置的功能，可以通过激活，指定参数等不同方式，进行环境的切换

### 多 profile 文件的方式

>   在编写主配置文件时，文件名可以是 ```application-(profile).properties/yml
>
>   ```yml
>   application-dev.yml
>   application-prod.yml
>   ```
>
>   ==但还是默认使用 application.yml/properties==

### 配置文件切换方式

*   使用 spring.profile.active 属性进行切换
*   可使用文档块 切换

```yml
# 此处选择环境
spring:
 porfiles:
  active: dev

---
spring:
 profiles: dev
server:
 port: 80
---
spring:
 profiles: prod
server:
 port: 80
```

### 命令行方式切换

```shell
--spring profile.active=dev
```

项目打包好之后，可以在运行 jar包时，使用命令

```shell
java -jar springBootJarProject.jar --spring.profiles.active=dev
```

### 虚拟机参数

```shell
-Dspring.profiles.active=dev
```

## 配置文件加载位置

spring 在加载配置文件时，有一定的优先级顺序

*   相同配置，大优先级会覆盖小优先级
*   可以使用属性：```spring.config.location```改变默认位置
    *   此参数也可以通过 命令行带参形式 进行调配

```l
file ./config
file ./
classpath:./config
classpath:./
```

## 其他路径加载配置优先级

*   命令行最优先
*   配置文件加载顺序

# 2. SpringBoot自动配置底层原理

>   此部分内容后补齐

# 3. 日志

## 日志简介

## 日志默认配置

