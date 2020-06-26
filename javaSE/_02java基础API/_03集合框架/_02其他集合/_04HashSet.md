# HashSet
> 无顺序,不可重复

```text
Set 中的元素不能重复
    同时也没有严格的顺序可言
        所以不能依赖于Set的某种隐含的顺序机制
```

## 遍历
> Set 不提供 get 方法
>> 遍历必须使用迭代器或者 foreach

## HashSet 和 HashMap 的关系

```text
HashSet 并没有具体实现
    而是封装了一个 HashMap
        使用 HashMap 的 key 进行存储数据

而value是一个命名为PRESENT的static的Object对象，因为是一个类属性，所以只会有一个。
```

# 练习 找出重复种类

```text
使用 Set 实现

在比较字符串章节，有一个同样的练习
创建一个长度是100的字符串数组
使用长度是2的随机字符填充该字符串数组
统计这个字符串数组里重复的字符串有多少种
使用HashSet来解决这个问题 
```

## 答案 理解

```java
package cn.how2j._02java中级._03集合框架._02其他集合._03HashSet.Exercise;

import cn.yzdz.random.RandomString;

import java.util.HashSet;
import java.util.Set;

/**
 * 练习 生成一百组随机字符(2个一组)
 * 找出重复的种类
 *
 * @author 彭继工
 * @version 1.0
 * @date 2020-03-25:16:58
 */
public class RandomTwo {
    public static void main(String[] args) {
        String[] ss = new String[1000000];
        Set<String> set = new HashSet<>();

        for (int i = 0; i < ss.length; i++) {
            ss[i] = new RandomString().numberAndLetter(10);
        }
        for (int i = 0; i < ss.length; i++) {
            System.out.print(ss[i] + "\t");
            if (0 == (i % 9)) {
                System.out.println();
            }
        }

        // 判断种类
        for (String tempW : ss) {
            int counter = 0;
            for (String tempN : ss) {
                if (tempW.equalsIgnoreCase(tempN)) {
                    counter ++;
                }
                if (counter >= 2) {
                    counter = 0;
                    set.add(tempN);
                }
            }
        }

        // 打印重复的种类
        System.out.println(set.toString());
    }
}
```