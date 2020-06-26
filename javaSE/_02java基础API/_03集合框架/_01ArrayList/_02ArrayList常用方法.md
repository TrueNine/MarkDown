# ArrayList常用方法

| 方法 | 说明 | 注释 |
|:---:|:---:|:---:|
| add(element,index) | 在集合的最后添加数据 | 或者指定索引添加 |
| contains(element) | 判断是否存在该集合 | 判断标准,是否是同一个对象 |
| get(index) | 获取指定位置的 值 | 会抛出数组越界异常 |
| indexOf(element) | 返回内容所在的索引 | 标准是对象是否相同 |
| remove(index or element) | 移出内容(传入 element 删除内容) | 并非删除,而是移出 |
| set(index,element) | 替换指定位置的内容 | 替换 |
| size() | 获取集合的大小 | 集合的内容长度 |
| toArray() | 将集合转换为数组 | 返回维护的数组 |
| addAll(ArrayList) | 将另一个容器的内容添加至集合 | 另一个容器 |
| clear() | 清空集合内的所有内容 | 清空 |

# 练习 判断是否相同

```text
如果就是要判断集合里是否存在一个 name等于 "hero 1"的对象，应该怎么做？ 
```

## 答案

```java
package cn.how2j._02java中级._03集合框架._01ArrayList._02ArrayList常用方法.Exercise;

import cn.how2j.Hero;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * 判断一个集合内的内容是否相等
 *
 * @author 彭继工
 * @date 2020-03-22:12:01
 */
public class Equals {
    public static void main(String[] args) {
        // 创建一个集合
        List<Hero> list = new ArrayList<>();

        // 向集合内添加内容
        list.add(new Hero("张三", 24));
        list.add(new Hero("李四",24));
        list.add(new Hero("王五",24));

        // 输入姓名
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入姓名");
        String name = scanner.nextLine();
        System.out.print("\r\b");

        // 循环遍历该集合
        int index = 0;
        for (Hero temp : list) {
            if (name.equals(temp.name)) {
                System.out.println("找到"
                        + name
                        + "在位置: "
                        + index);
            }
            index ++;
        }
    }
}
```

# 练习 MyStringBuffer

```text
做一个一样的MyStringBuffer练习，但是不使用字符数组，而是使用ArrayList来实现 
```

## 答案 不做了