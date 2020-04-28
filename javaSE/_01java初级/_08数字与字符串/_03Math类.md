# Math类
> java.util 提供的数学类

| 方法 | 作用 |
|---|---|
| round() | 四舍五入 |
| random() | 获取 0 - 1 之间的浮点数 |
| sqrt(number) | 开方,求平方根 |
| pow(number,number) | 开平方 |
| Math.PI | 圆周率 |
| Math.E | 自然常数 |

### 自然对数

```text
1 + (1/n)
```

# 练习

```text
这个图是自然对数的计算方式。
借助Math的方法，把自然对数计算出来，看看经过自己计算的自然对数和Math.E的区别有多大 
```

## 答案


```java
package cn.how2j._01java初级._08数字与字符串._03Math类.Exercise;

/**
 * 抄自然常数答案
 *
 * @author 彭继工
 * @date 2020-03-08:14:34
 */
public class Test {
    public static void main(String[] args) {
        System.out.println(Math.E);

        int n = Integer.MAX_VALUE;
        System.out.println(Math.pow(1 + 1d / n,n));
    }
}
```

# 练习 质数

```text
统计找出一千万以内，一共有多少质数

质数概念: 只能被1和自己整除的数
举例:
5只能被 1和5整除，所以是质数
8可以被2整除，所以不是质数 
```

## 答案 理解

```java
package cn.how2j._01java初级._08数字与字符串._03Math类.Exercise;

/**
 * 统计一千万以内
 * 有多少质数
 *
 * @author 彭继工
 * @date 2020-03-08:16:48
 */
public class PrimeNumber {
    public static void main(String[] args) {
        // 定义一个 一千万
        int max = 100;

        int counter = 0;
        for (int i = 1; i <= max; i++) {
            if (isPrime(i)) {
                counter ++;
            }
        }

        System.out.println(counter);
    }

    public static boolean isPrime(int n) {
        for (int i = 2; i <= Math.sqrt(n); i++) {
            System.out.println(Math.sqrt(n));
            if (0 == n % i) {
                return false;
            }
        }
        return true;
    }
}
```

### 理解 为什么取平方根

```text
假设 100 被 50 整除
结果是 2,但在原来就已经经过 2 了
```