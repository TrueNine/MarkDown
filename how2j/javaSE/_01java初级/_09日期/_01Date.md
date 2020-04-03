# Date
> 用以表示时间的类 java.util.Date

## 时间原点

```text
时间原点为 1970-1-1-00:00:00(格林威治时间)
	每过 1 毫秒 + 1(long 类型)
	中国是 +8 区(UTC-8)
```

## 创建时间对象
> Date

```java
// d 获取的是当前时间
Date d = new Date();

// d1 在初始化时候,往后推了 n 毫秒
long n = 1024;
Date d2 = new Date(n);
```

## getTime()
> 返回当前时间

```java
Date d = new Date(1024);

// 获取当前对象的 long 类型
long date = d.getTime();
System.out.println(date);
```

## System.currentTimeMillis();
> 获取当前时间的 long 类型

```java
long n = System.currentTimeMillis();
```

# 练习 随机日期

```text
借助随机数，创建一个从1995.1.1 00:00:00 到 1995.12.31 23:59:59 之间的随机日期 
```

## 答案

### 解读
> 封装进了工具类

```text
首先生成年月日时分秒毫秒

计算闰年的公式是 (1970 - y(需要的范围)) / 4 * day
	/ 4 (每隔四年 + 一天
		最后加上这个闰年部分
		
计算随机数值
	Math.random * (大数 - 小数) + 小数
		大数减去小数得到一个范围,然后加上小数
			如: 范围 1 - 5
				5 - 1 = 4(* 4 随机到 3)
					3 + 1 = 4;
			如: 范围 15 - 24;
				24 - 15 = 9(* 9 随机到 4)
					4 + 15 = 19;
```

```java
package cn.how2j._01java初级._09日期._01Date.Exercise;

import cn.yzdz.random.RandomNumber;

import java.util.Date;

/**
 * 获取随机时间
 * 1995 0101 - 1231 的随机时间
 *
 * @author 彭继工
 * @date 2020-03-11:18:42
 */
public class RandomTime {

    static final long millisecond = 1;
    static final long second = millisecond * 1000;
    static final long minute = second * 60;
    static final long hour = minute * 60;
    static final long day = hour * 24;
    static final long year = day * 365;
    static final long gregorianIndex = 1970;

    public static void main(String[] args) {

        // 生成随机时间
        long d = RandomNumber.randomLong(calculateLeapyear(1995),calculateLeapyear(1996),true);
        Date date = new Date(d);

        System.out.println(date);
    }

    public static long calculateLeapyear(long startNumber) {
        long tempTime = (startNumber - gregorianIndex) * year;
        // 计算闰年
        long leapDay = (startNumber - gregorianIndex) / 4 * day;

        // 计算时差

        long jetlagUTC = hour * 8;

        return (tempTime + leapDay) - jetlagUTC;
    }

}
```