# switch
> 相当于 if else 的另一种表达式

## switch 的使用

```text
switch 可以使用
    byte
    short
    int
    char
    String (1.7之后)
    enum(枚举)
    ...

注意:
    每个 表达式结束,都应该拥有一个 break
    String 在 JDK1.7 之前是不支持的
    enum是枚举类型,此处不做解释
```

### 示例

```java
int day = ?;

switch (day) {
    case 1:
        System.out.println("今天是星期一");
        break;
    case 2:
        System.out.println("今天是星期二");
        break;
    default:
        System.out.println("系统错误!");
        break;
}
```

# 练习 季节
```text
通过Scanner 输入月份，然后使用switch 判断季节 
```

## 答案
```java

```