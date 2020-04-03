# final
> 只有一次赋值机会的变量

## 在声明时赋值

```java
class Test {
    /** 常量 在声明时进行赋值 */
    final int i = 1024;

    public static void main(String[] args){
        // 如果再次进行赋值则会编译错误
        i = 24;
    }
}
```

## 声明时没有进行赋值
> 如果在声明时候不赋值,可以在后面的代码进行 一次唯一的赋值

```java
class Test {
    public static void main(String[] args){
        // 声明时没有进行赋值
        final int i;
        // 可以进行一次唯一的赋值
        i = 1024;
        // 再次赋值则会编译错误
        i = 2048;
    }
}
```

## 修饰其他

```text
还可以修饰方法,修饰类,处于后续章节的内容
```

# 练习 final

```text
如果final修饰的是参数，能否在方法里给这个参数赋值？ 
```
```java
public class HelloWorld {
 
    public void method1(final int j) {
        j = 5; //这个能否执行？
    }
}
```

## 答案 抄

```text
不行
    不可以，因为在调用方法的时候，就一定会第一次赋值了，后面不能再进行多次赋值 
```