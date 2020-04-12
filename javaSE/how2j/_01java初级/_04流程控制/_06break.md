# break
> 结束当前循环 或 ...

## 示例
```java
for (int i = 0; i < 10; i ++) {
    if (0 == i % 2) {
        // 使用 break 直接结束当前循环
        break;
    }
}
```

# 练习 百万富翁

```text
假设你月收入是3000，除开平时花销，每个月留下1000块钱进行投资。

然后你认真的钻研了 《股票和基金 21天从入门到精通》，达到了每年20%的投资回报率。

那么问题来了，以每个月投资1000块钱的节奏，持续投资多少年，总收入达到100万
（复利计算按照每年12000投入计算，不按照每月计息）

复利公式：
F = p* ( (1+r)^n );
F 最终收入
p 本金
r 年利率
n 存了多少年

假设情景一：
p = 10000
r = 0.05
n = 1

解读：
本金是10000
年利率是5%
存了一年 1次
复利收入 10000*( (1+0.05)^1 ) = 10500

假设情景二：
p = 10000
r = 0.05
n = 2

解读：
本金是10000
年利率是5%
存了两年
复利收入 10000*( (1+0.05)^2 ) = 11025 
```

## 答案 抄
> 恕在下实在是数学不行

```java
package cn.how2j._01java初级._04流程控制._06BREAK.Test;

/**
 * 类作用: 练习
 * 类说明: 练习复利
 *
 * F = p* ( (1+r)^n );
 *
 * @author 彭继工
 * @date 2020 - 02 - 27:16:04
 */
public class Test {
    public static void main(String[] args) {
        // 计算每年
        int fundMonth = 1000;
        int fundYear = fundMonth * 12;
        // 定义利率
        float rate = 0.2f;

        // F = p* ( (1+r)^n );

        // 计算利率
        // 总和
        int sum = 0;
        // 目标钱数
        int target = 1000 * 1000;

        for (int w = 1; w < 100; w++) {
            // 定义年数
            int year = w;
            float compoundinterestrate = 1;

            for (int n = 0; n < year; n++) {
                compoundinterestrate *= (1 + rate);
            }

            // 计算复利
            int compoundInterest = (int) (fundYear * compoundinterestrate);
            sum += compoundInterest;
            System.out.println("经过" + year + "年,总收入: " + sum);

            if (sum >= target) {
                System.out.println("一共需要: " + year + " 累计收入: " + target);
                break;
            }
        }
    }
}
```