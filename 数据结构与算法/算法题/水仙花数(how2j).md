# 水仙花数
> 来自 how2j.cn 的 流程控制/综合练习/水仙花数

```text
水仙花数定义：
1. 一定是3位数
2. 每一位的立方，加起来恰好是这个数本身，比如153=1*1*1+5*5*5+3*3*3

寻找所有的水仙花数
```

```java
package cn.how2j._01java初级._04流程控制._08综合练习.Test1;

/**
 * 类作用: 练习
 * 类说明: 测试水仙花数
 *
 * @author 彭继工
 * @date 2020 - 02 - 27:18:22
 */
public class Test2 {

    /** 百位数 */
    public static final int BAIWEI = 100;
    /** 千位数 */
    public static final int QIANWEI = 1000;

    public static void main(String[] args) {
        // 一层循环解决
        for (int i = BAIWEI; i < QIANWEI; i++) {
            // 定义内部临时变量,分别得到每位数的值
            // 221 / 100 = 2
            int baiwei = i / 100;
            // (221 / 10 = 22) % 10 = 2
            int shiwei = i / 10 % 10;
            // 221 % 10 = 1
            int gewei = i % 10;

            // 计算水仙花数的立方
            int result = baiwei * baiwei * baiwei;
            result += shiwei * shiwei * shiwei;
            result += gewei * gewei * gewei;

            // 判断是否为水仙花数
            if (result == i) {
                // 分别输出百位,十位,个位
                System.out.print("baiwei = " + baiwei + " ");
                System.out.print("shiwei = " + shiwei + " ");
                System.out.print("gewei = " + gewei + " ");

                // 输出结果位数
                System.out.println("找到水仙花数: " + result);
            }
        }
    }
}
```

# 个人总结

```text
定义的循环: 起始不小于100,最大不大于1000,保证在三位数以内

分别计算数值的,百位,十位,个位

依照水仙花数的计算方式计算

判断是否和当前循环条件的数值是否相等

如果相等则输出
```