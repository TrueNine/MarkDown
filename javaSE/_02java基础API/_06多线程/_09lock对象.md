# LOCK 对象

>   lock也能达到更好的效果,属于: ```java.util.concurrent

## synchronized 的同步方式

*   当一个对象占用了 synchronized 同步对象,其他县城就不能同时占用,直到释放同步对象

## 使用 lock 对象实现同步

>   Lock 是一个借口(java.util.concurrent),需要用到```ReentrantLock();```

```java
Lock lock = new ReentrantLock();
```

|       方法        | 说明                                             | 注释                              |
| :---------------: | ------------------------------------------------ | --------------------------------- |
|      lock()       | 当前线程占有 lock 对象,一旦占用,其他对象不可占用 | 不会自动释放                      |
|     unlock()      | 手动释放,如果没有进行锁,则会抛出异常             | 旺旺放在 finally 执行,必须判断    |
| boolean trylock() | 会在指定时间范围内占用,如果占用不成功则直接退出  | 会返回一个布尔值,显示是否先用成功 |

### 线程交互

>   Lock 也提供了线程交互的一些方法

1.  通过 Lock 得到一个 Condition 对象: 

```java
// 创建一个 Lock
Lock lock = new ReentrantLock();
// 通过 Lock 获取一个 Condition 对象
Condition condition = lock.newCondition();
```

#### 通知方法

*   await(); 线程睡眠
*   signal(); 唤醒线程
*   signalAll(); 唤醒所有线程

### 区别总结

| synchronized                      | Lock                      |
| --------------------------------- | ------------------------- |
| 是java关键字,语言层面的实现       | 是一个借口,代码层面的实现 |
| 一直获取锁,需要良好的设计避免死锁 | 可以选择获取的锁,释放锁   |
| synchronized 结束自动释放锁       | 需要手动释放              |

# 练习 借助Lock,实现线程安全的 MyStack

```text
在练习-线程安全的MyStack 练习中，使用synchronized把MyStack修改为了线程安全的类。

接下来，借助Lock把MyStack修改为线程安全的类 
```

## 答案

```java
package cn.how2j._02java中级._06多线程._09LOCK对象.Exercise;

import cn.yzdz.outConsole.Print;

import java.util.LinkedList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 在练习-线程安全的MyStack 练习中，使用synchronized把MyStack修改为了线程安全的类。
 *
 * 接下来，借助Lock把MyStack修改为线程安全的类
 *
 * @author TrueNine
 * @version 1.0
 * @time 2020/4/5
 */
public class MyStack {
    public static void main(String[] args) throws InterruptedException {
        MyStacks<String> stack = new MyStacks<>();
        while (true) {
            new Thread(() -> {
                int index = 0;
                while (true) {
                    index++;
                    Print.newLine("往栈内添加数据");
                    stack.push("数据" + index);
                    Print.newLine("测试查看栈顶");
                    System.out.println(stack.peek());
                }
            }).start();
        }
    }
}

class MyStacks<E> {

    /**
     * 栈的长度
     * 只能存放指定长度的数据
     */
    private int size;

    /**
     * 核心容器
     * 用于实现栈
     *
     * @see LinkedList 使用此类实现
     */
    private LinkedList<E> stack = new LinkedList<>();

    /**
     * 核心锁,用于控制线程安全
     *
     * @see ReentrantLock 使用此类实现
     */
    private Lock stackLock = new ReentrantLock();

    public void push(E e) {
        // 获取锁,如果 3 秒内没有获取到,自动放弃
        boolean is = false;
        try {
            is = stackLock.tryLock(3,TimeUnit.SECONDS);
            stack.addLast(e);
            this.size += 1;
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        } finally {
            if (is) {
                stackLock.unlock();
            }
        }
    }
    public E pull() {
        // 获取锁,如果 3 秒内没有获取到,自动放弃
        boolean is = false;
        E e = null;
        try {
            is = stackLock.tryLock(3,TimeUnit.SECONDS);
            e = this.stack.removeLast();
            this.size -= 1;
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        } finally {
            if (is) {
                stackLock.unlock();
            }
        }
        return e;
    }
    public E peek() {
        // 获取锁,如果 3 秒内没有获取到,自动放弃
        boolean is = false;
        E e = null;
        try {
            is = stackLock.tryLock(3,TimeUnit.SECONDS);
            e = this.stack.getLast();
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        } finally {
            if (is) {
                stackLock.unlock();
            }
        }
        return e;
    }
    public int size() {
        int l = -1;
        try {
            stackLock.lock();
            l = size;
        } finally {
            stackLock.unlock();
        }
        return l;
    }
}
```

# 练习 解决死锁

>   使用 trylock(),答案不写了

# 练习

```text
在练习-生产者消费者问题这个练习中，是用wait(), notify(), notifyAll实现了。

接下来使用Condition对象的：await, signal,signalAll 方法实现同样的效果 
```

## 答案

```text
就是使用 await(),signal(),signalAll() 代替
```

