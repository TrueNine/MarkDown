# continue
> 循环内使用 continue 直接跳过本次循环

```java
for (int i = 0;i < 100; i ++) {
    if (2 == i) {
        System.out.println(i);
    } else {
        continue;
    }
}
```

# 练习 忽略倍数
```text
打印 1-100 之间的数，如果这个数，要么是3，要么5的倍数，就忽略掉
```

## 答案
```java
package cn.how2j._01java初级._04流程控制._05CONTINUE.Test;

/**
 * 类作用: 练习
 * 类说明: 练习忽略倍数
 *
 * 打印 1-100 之间的数，如果这个数，要么是3，要么5的倍数，就忽略掉
 *
 * @author 彭继工
 * @date 2020 - 02 - 27:15:44
 */
public class Test {
    public static void main(String[] args) {
        int number = 100;

        for (int i = 1; i <= number; i++) {
            // 此处发生错误,应该将 i 放在前面,否则会直接忽略 1
            if (0 == i % 3 || 0 == i % 5) {
                continue;
            } else {
                System.out.println("i = " + i);
            }
        }
    }
}
```