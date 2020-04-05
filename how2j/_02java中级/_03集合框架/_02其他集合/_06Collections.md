# Collections
> 操作容器的工具类
>> 如同 Arrays 一样

| 方法 | 说明 | 注释 |
|:---:|:---:|:---:|
| reverse() | 使容器内数据反转 |   |
| shuffle() | 混淆容器中元素的顺序 | 随机混淆 |
| sort() | 对容器进行排序 |   |
| swap(list,index,index) | 交换两个索引元素的位置 |   |
| rotate(list,length) | 向右滚动指定位置的长度 | 滚动! |
| synchronizedList() | 转换为线程安全的容器 | 多线程 |

# 练习 统计概率

```text
首先初始化一个List,长度是10，值是0-9。
然后不断的shuffle，直到前3位出现
3 1 4

shuffle 1000,000 次，统计出现的概率 
```

## 答案 不理解

```java
package cn.how2j._02java中级._03集合框架._02其他集合._06Collections.Exercise;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 练习 随机排列统计概率
 *
 * @author 彭继工
 * @version 1.0
 * @date 2020-03-26:13:23
 */
public class Shuffle {
    public static void main(String[] args) {
        // 初始化一个容器,存放10000个数据
        List<Integer> list = new ArrayList<>();

        // 给容器赋值
        int init = 10;
        for (int i = 0; i < init; i++) {
            list.add(i);
        }


        // 进行 指定次数的 双随机排列
        // 在混淆顺序的同时,进行统计次数
        int max = 1000 * 1000;
        int counter = 0;
        for (int i = 0; i < max; i++) {
            Collections.shuffle(list);
            if (
                    3 == list.get(0)
                    && 1 == list.get(1)
                    && 4 == list.get(2)
            ) {
                counter ++;
            }
        }

        // 进行计算概率
        double result = ((double) counter / (double) max);
        result *= 100;
        System.out.println(counter);
        System.out.println(result);
    }
}
```