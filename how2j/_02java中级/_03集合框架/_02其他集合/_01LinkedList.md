# LinkedList
> 双向链表实现的 List

## 队列和栈的区别

* 队列 FIFO Queue: 先进先出,后进后出
* 栈 FILO Stack: 先进后出,后进先出

## List的实现

```text
LinkedList 同时实现了:
    List 接口
    Deque 双向链表接口
    Queue 队列接口
```

# 练习 实现队列

```text
根据接口实现一个用 LinkedList 实现的队列
```
```java
package collection;
 
import charactor.Hero;
 
public interface Stack {
 
    //把英雄推入到最后位置
    public void push(Hero h); 
    //把最后一个英雄取出来
    public Hero pull(); 
    //查看最后一个英雄
    public Hero peek();
}
```


## 答案

```java
package cn.how2j._02java中级._03集合框架._02其他集合._01LinkedList.Exercise;

import cn.yzdz.outConsole.Print;

import java.util.LinkedList;
import java.util.List;

/**
 * 练习
 * 实现 MyQueue接口
 *
 * @author 彭继工
 * @version 1.0
 * @date 2020-03-24:16:45
 */
public class Queues<T> implements MyQueue {
    public static void main(String[] args) {
        Queues<Integer> q = new Queues<>(5);
        System.out.println(Print.line("查看现在栈内的长度"));
        System.out.println(q.length);
        System.out.println(q.size());

        System.out.println(Print.line("向站内推送数据"));
        q.push(1);
        q.push(2);
        q.push(3);
        q.push(4);
        System.out.println(q.length);
        System.out.println(q.size());

        System.out.println(Print.line("从站内取出数据"));
        System.out.println(q.peek());
        q.pull();
        q.pull();
        System.out.println(q.peek());
    }

    /**
     * 维护的核心数据
     * 初始化长度为 size
     * @version 1.0
     */
    private List<Object> value;

    /**
     * 栈的总长度
     */
    private int length;
    /**
     * 栈现在的索引
     * 默认指向第一个数据
     */
    private int index;

    /**
     * 空构造器
     * 初始化栈为 5 长度
     */
    public Queues() {
        value = new LinkedList<>();
        this.index = 0;
    }

    /**
     * 构造器
     * 初始化栈的长度为 length
     * @param length 栈的长度
     */
    public Queues(int length) {
        this();
        this.length = length;
    }

    /**
     * 往栈内推送数据
     *
     * @param o 推送的数据
     */
    @Override
    public void push(Object o) {
        isFullException();
        // 往栈内推送数据
        value.add(o);
        this.index ++;
    }

    /**
     * 出栈,返回栈内的第一个内容
     * @return 内容
     */
    @Override
    public Object pull() {
        isEmptyException();

        int tempIndex = index;
        index --;
        return value.get(tempIndex - 1);

    }

    /**
     * 返回栈内的第一个元素
     *
     * @return 第一个元素
     */
    @Override
    public Object peek() {
        return value.get(index - 1);
    }

    /**
     * 方法,返回现在站内的总长度
     *
     * @return 真实数据的总长度
     */
    public int size() {
        if (isEmpty()) {
            return 0;
        }
        return index;
    }

    /**
     * 两个方法,用于判断栈内是否为空
     * 判断条件: 链表引用没有指向 或者 长度为 0
     *
     * @return boolean
     */
    public boolean isEmpty() {
        boolean is = false;
        if (null == value || 0 >= length - index) {
            is = true;
        }
        return is;
    }

    /**
     * 用于抛出异常
     * 调用上方法 isEmpty
     * 如果条件成立,则直接抛出异常
     *
     * @return boolean
     */
    private boolean isEmptyException() {
        if (isEmpty()) {
            throw new RuntimeException("栈现在为空");
        }
        return false;
    }

    /**
     * 用于判断该栈是否已经满
     *
     * @return boolean
     */
    public boolean isFull() {
        boolean is = false;
        if (index + 1 == length) {
            is = true;
        }
        return is;
    }

    /**
     * 用于抛出栈已满异常
     *
     * @return boolean
     */
    private boolean isFullException() {
        boolean is = false;
        if (isFull()) {
            throw new RuntimeException("栈已满");
        }
        return false;
    }
}

```