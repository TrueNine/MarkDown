# 准备文件

```java
public class hello {
    public static void main(String[] args) {
        System.out.println("hello world!\n");
    }
}
```
> 建立一个名为: java 的目录
>2. 在目录内建立一个名为: hello.java 的类文件
>3. 用==文本编辑器==打开该文件,将上述代码复制进文件,然后保存关闭

## 打开文件运行

1. 打开 命令提示符
2. 进入相应的文件位置
```
cmd:
    char: 进入 相对 的 char 盘符
    cd path: 进入相应的 path 文件路径
        注意: win 的 文件层级使用 \ ,并非 Linux 的 /
            示例: java\code\hello.java
```
3. 输入 javac 文件名.java , 将 Java 文件编译为 class 字节码文件
4. 输入 java 文件名 (不带后缀) , 执行 class 文件

# 练习 编译文件

```
按照以上步骤,输出 hello java
```