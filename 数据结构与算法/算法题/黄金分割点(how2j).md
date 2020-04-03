# 黄金分割地点
> 来自 how2j/流程控制/综合练习

```text
寻找某两个数相除，其结果 离黄金分割点 0.618最近

分母和分子不能同时为偶数
分母和分子 取值范围在[1-20]
```

```java
package cn.how2j._01java初级._04流程控制._08综合练习.Test1;

/**
 * 类作用: 练习
 * 类说明: 黄金分割点0.618
 *
 * @author 彭继工
 * @date 2020 - 02 - 27:16:40
 */
public class Test {
    /** 需要的最大值 */
    private static final int  MAX = 32767;
    /** 黄金分割点 */
    private static final float RANGE = 0.618f;
    /** 最大的比较数值 */
    private static double MINDIFF = Integer.MAX_VALUE;

    public static void main(String[] args) {
        // 定义分子分母
        int fenzi = 0;
        int fenmu = 0;

        // 结果分子和分母
        float resultFenzi = 0;
        float resultFenmu = 0;

        for (fenzi = 1; fenzi <= MAX; fenzi ++) {
            for (fenmu = 1; fenmu <= MAX; fenmu ++) {
                // 分子和分母不能同时为偶数
                if (0 == fenzi %2 && 0 == fenmu % 2) {
                    continue;
                } else {
                    // 取值,此处必须是浮点运算,所以需要强转
                    float value = (float) fenzi / fenmu;

                    // 取 离黄金分割点最近的差值
                    float diff = value - RANGE;

                    // 取绝对值
                    diff = diff < 0 ? 0 - diff : diff;

                    // 找出最小的差值,并且取出分子和分母
                    if (diff < MINDIFF) {
                        MINDIFF = diff;
                        // 取出分子和分母
                        resultFenzi = fenzi;
                        resultFenmu = fenmu;
                    }
                }
            }
        }

        double resultSum = resultFenzi / resultFenmu;
        System.out.println("离黄金分割点最近的值是: " + resultFenzi + " / " + resultFenmu + " = " + resultSum);
    }
}
```

# 个人总结

```text
首先定义取值范围: 黄金分割点0.618,运算范围,一个最大值比较数

定义两个循环变量(分子和分母),分别内外循环,不断计算范围内的结果

定义两个结果分子分母,用以记录结果的分子分母

在循环内计算的时候,判断是否两边同时是 偶数,如果同时是偶数,则计算下一组

每次计算: 
    记录差值: 计算 分子 / 分母的结果,计算结果与黄金分割点的距离(差值)
    对差值取绝对值: 差值不可以是 0,如果是 负数,则取0,否则取当前值
    比较历史最小值: 如果发现当前值比历史记录值小,则更新历史记录值为当前的最小值
    更新结果分子分母: 在更新记录的同时,将当前循环使用的分子分母,赋值给结果分子分母

最后输出: 结果分子,结果分母,计算得到的结果
```