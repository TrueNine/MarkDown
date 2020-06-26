# File类
> 操作文件的类

* 构造器传入 相对路径 创建文件对象
* 构造器传入 绝对路径 创建文件对象
* 构造器传入 文件对象,文件路径 文件对象为父目录,创建文件对象

## 常用方法
> 都必须建立在确实存在物理文件的情况

| 方法 | 说明 | 注释 |
|:---:|:---:|:---:|
| exists() | 文件是否存在 | 物理文件 |
| isDirectory() | 文件是否是目录 | 布尔 |
| isFile() | 是否是文件 | 布尔 |
| length() | 文件长度 | b 计算 |
| lastModified() | 文件最后修改时间 | long |
| setLastModified(Date) | 修改文件最后修改时间 |   |
| renameTo(File) | 修改文件名称 | 物理文件名称 |
| list() | 以字符串数组的形式返回当前文件夹下的所有文件 | 字符串数组 |
| listFiles() | 返回当前目录下的所有文件对象 | 文件对象 |
| getParent() | 返回当前所在文件夹 | 字符串形式 |
| getParentFile() | 返回当前所在文件夹 | 文件对象形式 |
| mkdir() | 创建文件夹 | 必须父目录存在,否则创建无效 |
| mkdirs() | 创建文件夹 | 父目录不存在则创建父目录 |
| creatNewFile() | 创建文件(空) | 如果父目录不存在则抛出异常 |
| listRoots() | 列出所有盘符 | 貌似 linux 没有盘符 |
| delete() | 删除文件 |   |
| deleteOnExit() | JVM 运行结束时删除文件 | 常用于删除临时文件 |

# 练习 遍历文件

```text
一般说来操作系统都会安装在C盘，所以会有一个 C:\WINDOWS目录。

遍历这个目录下所有的文件(不用遍历子目录)

找出这些文件里，最大的和最小(非0)的那个文件，打印出他们的文件名

注: 最小的文件不能是0长度 
```

## 答案

```java

```

# 练习 遍历子文件

```text
同上的练习，要求遍历子文件夹 
```

## 答案

```java
package cn.how2j._02java中级._02IO._01File类.Exercise;

import java.io.File;

/**
 * 练习遍历文件
 * 同时遍历子文件
 *
 * @author 彭继工
 * @date 2020-03-17:12:44
 */
public class FileForeach {
    public static void main(String[] args) {
        // 创建文件
        File f = new File("C:/WINDOWS");
        System.out.println(f.isFile());

        // 调用方法遍历下方文件,使用递归
        files(f);

        // 打印测试
        System.out.println("最大文件是: "
            + maxFile.getParent() + maxFile.getName()
            + "最小文件是: "
            + minFile.getParent() + minFile.getName()
        );
    }

    boolean isReturn = false;
    static long max = 0;
    static long min = Long.MAX_VALUE;
    static File maxFile = null;
    static File minFile = null;

    public static void files (File file) {
        files(file,1);
    }
    public static void files(File file,int index) {
        for (int i = 0; i < index; i++) {
            System.out.print("-");
        }
        System.out.print(index + ":" + file.getName());
        if (file.isDirectory()) {
            System.out.print("^" + "\n");
        }

       File[] fileArray = file.listFiles();

       if ( ! (null == fileArray || 0 == fileArray.length)) {
           for (int i = 0; i < fileArray.length; i++) {
                // 判断内容是否是目录,如果是目录则递归
               if (fileArray[i].isDirectory()) {
                   files(fileArray[i],index + 1);
               } else {
                   // 否则就是文件,进行判断
                   if (fileArray[i].length() > max) {
                       max = fileArray[i].length();
                       maxFile = fileArray[i];
                   }
                   if (0 != fileArray[i].length() && fileArray[i].length() < min) {
                       min = fileArray[i].length();
                       minFile = fileArray[i];
                   }
               }
           }
       }
    }
}
```