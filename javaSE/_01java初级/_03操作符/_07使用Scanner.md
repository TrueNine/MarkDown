# 使用Scanner

| 方法 | 作用 |
|---|---|
| Scanner.nextInt(); | 读取 int 整数 |
| Scanner.nextDouble(); | 读取 double 浮点数 |
| Scanner.nextFloat(); | 读取 float 浮点数 |
| Scanner.nextLong(); | 读取 long 整数 |
| Scanner.nextLine(); | 读取一行字符串 |

## 使用 Scanner

```text
需要先建立对象,传入System.in 参数
Scanner scanner = new Scanner(System.in);

接着使用对象进行
    示例:
        scanner.nextLine();
```

## 注意
```text
读取完整数,浮点数....
    之后使用 .nextLine() 读取一行时
    会直接略过

其他只会读取相应的数据,会将回车换行 \r\n 留下
    所以还需要读取,就需要刷新一次
        使用两次 scanner.nextLine();
            将 \r\n 读取掉
```