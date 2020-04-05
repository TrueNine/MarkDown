# Arrays
> java.util 包 提供的 操作数组的工具类

## 方法表

| 方法 | 作用 |
|---|---|
| copyOfRange(源数组,起始位置,结束位置) | 复制数组 |
| toString(数组) | 返回一个字符串形式的数组 |
| sort() | 排序 |
| binarySeach(元素) | 搜索元素,返回索引位置 |
| equals(数组,数组) | 比较连个数组是否相同 |
| fill(元素) | 填充整个数组 |

## 数组复制

```java
int a = new int[] {1,2,3,4,5};
int b = Arrays.copyOfRange(a,0,3);
```

## 转换字符串

```java
int[] a = new int[] {1,2,3};
String str = Arrays.toString();
System.out.println(str);
```

## 排序

```java
int[] a = new int[] {1,3,2};
Arrays.sort(a);
```

## 搜索

* 需要先进行排序
* 如果有多个相同的数据,结果是不确定的
* 如果查找不到,返回 -1

```java
int[] a = new int[] {1,2,3};
Arrays.sort(a);
int index = Arrays.binarySeach(a,3);
```

## 判断是否相同

```java
boolean is = Arrays.equals(aArray,bArray);
```

## 填充

```java
Arrays.fill(Array,1);
```

# 练习 二维数组排序

```text
先定义一个5X8的二维数组，然后使用随机数填充满。
借助Arrays的方法对二维数组进行排序。
参考思路：
先把二维数组使用System.arraycopy进行数组复制到一个一维数组
然后使用sort进行排序
最后再复制回到二维数组。
```

## 答案 抄

```java
package cn.how2j._01java初级._05数组._07Arrays.Test;

import cn.yzdz.random.RandomNumber;

import java.util.Arrays;

/**
 * 类作用: 练习
 * 类说明: 给二维数组排序
 *
 * 思想是给一个一维数组排序,然后赋值回二维数组
 *
 * @author 彭继工
 * @date 2020 - 02 - 29:18:08
 */
public class Test {
    public static void main(String[] args) {
        // 创建一个 5 * 8 的数组
        int[][] twoArray = new int[5][8];

        // 对数组进行赋值
        for (int w = 0; w < twoArray.length; w++) {
            for (int n = 0; n < twoArray[w].length; n++) {
                twoArray[w][n] = RandomNumber.randomInt(100,false);
            }
        }

        // 打印测试
        System.out.println("排序前操作");
        for(int[] tempArr : twoArray) {
            System.out.println(Arrays.toString(tempArr));
        }

        // 进行排序
        // 创建一个长度是 二维数组 的 一维数组
        int[] oneArray = new int[twoArray.length * twoArray[0].length];

        // 平铺到一维数组
        for (int i = 0; i < twoArray.length; i++) {
            System.arraycopy(twoArray[i],0,oneArray,i * twoArray[i].length,twoArray[i].length);
        }

        // 打印一维数组
        System.out.println("平铺为一维数组");
        System.out.println(Arrays.toString(oneArray));

        // 对一维数组paixu
        Arrays.sort(oneArray);
        System.out.println("排序后");
        System.out.println(Arrays.toString(oneArray));

        // 将一维数组,放置到二维数组
        for (int i = 0; i < twoArray.length; i++) {
            System.arraycopy(oneArray,i * twoArray[i].length,twoArray[i],0,twoArray[i].length);
        }

        // 打印测试结果
        System.out.println("放回到二维数组");
        for (int[] tempArr : twoArray) {
            System.out.println(Arrays.toString(tempArr));
        }
    }
}
```