# 小学算术题
```text
提示使用多层循环嵌套解决

计算出四个 ? 的值
```
| - | - | - | -| - |
|---|---|---|---|---|
| ? | + | ? | = | 8 |
| + |   | + |   |   |
| ? | - | ? | = | 6 |
| = |   | = |   |   |
| 14 |   | 10 |   |   |

```java
package cn.how2j._01java初级._04流程控制._08综合练习.Test1;

/**
 * 类作用:
 * 类说明:
 *
 * @author 彭继工
 * @date 2020 - 02 - 27:19:02
 */
public class Test3 {
    public static void main(String[] args) {
        int a = 0;
        int b = 0;
        int c = 0;
        int d = 0;

        for (a = -100; a <= 100; a ++) {
            for(b = -100; b <= 100; b ++) {
                for(c = -100; c <= 100; c ++) {
                    for(d = -100; d <= 100; d ++) {
                        // 表达式太长,使用布尔变量代替
                        boolean A = 8 == (a + b);
                        boolean B = 6 == (c - d);
                        boolean C = 14 == (a + c);
                        boolean D = 10 == (b + d);
                        boolean is = A && B && C && D;

                        if (is) {
                            System.out.println("a: " + a);
                            System.out.println("b: " + b);
                            System.out.println("c: " + c);
                            System.out.println("d: " + d);
                        }
                    }
                }
            }
        }
    }
}
```

# 个人总结
```text
使用多层循环嵌套: 
    每层循环,每次循环,分别包含不同的值
    在每一次最外层循环结束,计算能否得到相应的值
    如果得不到值,则进入下一轮循环执行,直到找到值
在最内层循环判断是否计算正确

最终输出计算的每个值
```