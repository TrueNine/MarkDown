# for
```text
跟 while 有些时候等价
```

## 示例

```java
// while 的示例
int w = 0;
while (w < 5) {
    System.out.println("test");
    w ++;
}

// for 循环,同上等价
for (int i = 0;i < 5;i ++) {
    System.out.println("test");
}
```

# 练习 乞讨
```text
天朝有一个乞丐姓洪，去天桥要钱
第一天要了1块钱
第二天要了2块钱
第三天要了4块钱
第四天要了8块钱
以此类推

问题： 洪乞丐干10天，收入是多少？
```

## 答案
```java
package cn.how2j._01java初级._04流程控制._04FOR.Test;

/**
 * 类作用: 练习
 * 类说明: 练习乞讨
 *
 * 天朝有一个乞丐姓洪，去天桥要钱
 * 第一天要了1块钱
 * 第二天要了2块钱
 * 第三天要了4块钱
 * 第四天要了8块钱
 * 以此类推
 *
 * 问题： 洪乞丐干10天，收入是多少？
 *
 * @author 彭继工
 * @date 2020 - 02 - 27:15:17
 */
public class Test {
    public static void main(String[] args) {
        // 乞丐的钱数
        int money = 0;
        // 乞丐的乞讨天数
        int days = 10;
        // 乞讨的总和
        int sum = 0;
        for (int i = 1; i <= days;i ++) {
            if (0 == money) {
                System.out.println("第一天");
                money = 1;
            } else {
                money *= 2;
            }
            sum += money;
            System.out.println("money = " + money);
            System.out.println("sum = " + sum);
        }
        System.out.println("乞丐的钱数: " + money);
        System.out.println("sum = " + sum);
    }
}
```