# 循环
> 重复执行指定的代码块

## while
> 条件为 true 时,重复执行

```java
// 这是一个死循环
while (true) {
    i ++;
    System.out.println(i);
}
```

## do while
> 条件为 true 时,重复执行,至少执行一次

```java
do {
    System.out.println("至少执行一次");
} while (false);
```

# 练习 阶乘
```text
通过Scanner 获取一个整数，然后使用while计算这个整数的阶乘

N的阶乘等于 N* (N-1) * (N-2) * ... * 1
```

## 答案

```java
package cn.how2j._01java初级._04流程控制._03WHILE.Test;

import java.util.Scanner;

/**
 * 类作用: 练习
 * 类说明: 练习阶乘
 * 通过Scanner 获取一个整数，然后使用while计算这个整数的阶乘,使用了倒退乘法
 *
 * N的阶乘等于 N* (N-1) * (N-2) * ... * 1
 *
 * @author 彭继工
 * @date 2020 - 02 - 27:14:23
 */
public class Test {
    public static void main(String[] args) {
        // 创建 Scanner
        Scanner scanner = new Scanner(System.in);

        // 接收阶乘的数量
        System.out.println("请输入阶乘数目");
        int number = scanner.nextInt();

        // 开始计算阶乘
        int counter = number;
        // 此处如果定义为 1 <= 则进入会变成 0
        while (1 < counter) {
            counter --;
            number *= counter;
            System.out.print("counter = " + counter + " | ");
            System.out.println("number = " + number);
        }
        System.out.println(number);
    }
}
```