# StringBuffer
> 可变字符序列 (安全 synchronized)

## 方法表

| 方法 | 作用 |
|---|---|
| append(String) | 在字符串最后追加字符串 |
| delete(index,index) | 删除 index 区间的字符串 |
| insert(index,String) | 在指定位置插入字符串 |
| reverse() | 反转字符串 |

## StringBuffer 简析

```text
和 String 一样,维护了一个字符数组
	但 StringBuffer 留有冗余长度
	追加的长度超过冗余长度,则才新增字符串
```

# 练习 比较性能

```java
System.currentTimeMillis();
```
```text
使用上述方法,比较String 和 StringBuffer 的性能
	分别拼接一万次随机串
```

## 答案

```java
package cn.how2j._01java初级._08数字与字符串._09StringBuffer.Exercise;

import cn.yzdz.outConsole.Print;
import cn.yzdz.random.RandomString;

/**
 * 比较String 和 StringBuffer 的性能
 * 可以见得,差距不止一星半点
 *
 * @author 彭继工
 * @date 2020-03-10:12:10
 */
public class Comparators {
    public static void main(String[] args) {
        // 准备
        String str = new String();
        StringBuffer buffer = new StringBuffer();
        RandomString random = new RandomString();
        int counter = 100 * 1000;

        long start = System.currentTimeMillis();

        for (int i = 0; i < counter; i++) {
            str += random.letter(5);
        }

        long end = System.currentTimeMillis();

        System.out.println(Print.line("String拼接结果"));
        System.out.println(end - start);

        // 测试 StringBuffer
        long s = System.currentTimeMillis();

        for (int i = 0; i < counter; i++) {
            buffer.append(random.letter(5));
        }

        long e = System.currentTimeMillis();
        System.out.println(Print.line("Buffer的拼接结果"));
        System.out.println(e - s);
    }
}
```

# 练习 MyStringBuffer

```java
package character;
  
public interface IStringBuffer {
    public void append(String str); //追加字符串 
    public void append(char c);  //追加字符
    public void insert(int pos,char b); //指定位置插入字符
    public void insert(int pos,String b); //指定位置插入字符串
    public void delete(int start); //从开始位置删除剩下的
    public void delete(int start,int end); //从开始位置删除结束位置-1
    public void reverse(); //反转
    public int length(); //返回长度
}
```
```text
根据接口设计 StringBuffer
```

## 答案

```java

```