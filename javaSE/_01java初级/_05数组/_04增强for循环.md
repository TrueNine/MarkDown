# 增强 for 循环
> 只能用来取值,不能修改数组内的值

## 示例

```java
int[] a = {1,2,3,4,5};

// 常规遍历
for (int i = 0; i < a.length; i ++) {
    int temp = a[i];
    System.out.println(temp);
}

// 使用增强 for 遍历
for (int temp : a) {
    System.out.println(temp);
}
```

# 练习 最大值
> 用增强型for循环找出最大的那个数

## 答案
```java
package cn.how2j._01java初级._05数组._04增强for循环.Test;

import java.util.Arrays;

/**
 * 类作用: 练习
 * 类说明: 使用增强 for 遍历找出最大值
 *
 * @author 彭继工
 * @date 2020 - 02 - 28:15:55
 */
public class Test {
    public static void main(String[] args) {
        int[] array = {100,10,102,103};

        System.out.println("Arrays.toString(array) = " + Arrays.toString(array));

        // 定义一个临时变量,存储比较值
        int max = 0;
        for (int temp : array) {
            if (max < temp) {
                max = temp;
            }
        }

        System.out.println("max = " + max);
    }
}
```