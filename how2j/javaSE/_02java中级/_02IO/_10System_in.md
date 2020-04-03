# System.in
> 打印流的一些扩展知识

* System.in: 本身是一个```InputStream 引用```
* System.out: 是一个```PrintStream 引用```

```text
其好像都指向了本地方法
    可以使用 System.setXXX 设置相应的处理流
    同时也可以使用引用指向这个对象,然后进行操作
```

## Scanner
> 一个用于控制台输入的工具类 java.util.Scanner

| 方法 | 作用 | 注释 |
|:---:|:---:|:---:|
| nextLine() | 读取一行字符串 | 注意会残留\n(需进行处理) |
| nextInt() | 读取 int | 不能是其他字符 |
| nextBoolean() | 读取 boolean | true/false |
| next... | 其他一些输入 |   |

# 练习 自动创建类

```text

```