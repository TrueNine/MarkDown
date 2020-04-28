# Object类
> 所以类的直接或间接父类 (老祖宗),同时提供了一些方法

```text
无论一个类怎么样,都会间接继承 Object
	即使不明显书写,都会默认继承
```

```java
// 声明一个类,默认继承 Object
class /* extends Object */ {
	
}
```

## toString();
> 对当前对象的字符串表达

* 打印对象,就是调用对象的 ```toString();``` 方法

## finalize();
> 不是开发人员主动调用的方法,而是 JVM 调用

```text
当一个对象没有任何引用指向时,就满足了垃圾回收机制
被回收时,就会调用 finlize() 方法
将垃圾回收
```

## hashCode();
> 返回对象的 哈希值 

## == & equals();

### ==
> 这不是 Object 的方法

```text
判断两个对象是否相等
	判断的是: 两个引用,是否指向同一对象
```

### equals();
> 比较两个对象,默认比较 hashcode 是否相等

## 线程同步方法
> 在线程同步的章节展开

* wait();
* notify();
* notifyAll();

## getClass();
> 返回一个对象的 类对象(现阶段不需要了解)

# 练习 Object

```text
重写Item的 toString(), finalize()和equals()方法
toString() 返回Item的name + price
finalize() 输出当前对象正在被回收
equals(Object o) 首先判断o是否是Item类型，然后比较两个Item的price是否相同 
```

## 答案
> 直接写在了工具类内

```java
package cn.how2j;

/**
 * 类作用: 工具类
 * 类说明: how2j 例子
 * <p>
 * 因为 how2j 的需要,所以直接写成工具类
 * 这是一个物品类,大概意思是有价格,有名称
 * 还重写了方法
 *
 * @author 彭继工
 * @date 2020 - 03 - 06:15:57
 */
public class Item {

    /** 物品名称 */
    public String name;
    /** 物品价格 */
    public float price;

    /**
     * 空构造器
     */
    public Item() {

    }

    /**
     * 传入名称,初始化物品
     *
     * @param name 物品名称
     */
    public Item(String name) {
        this.name = name;
    }

    /**
     * 构造器
     * 通过名称和价格初始化物品
     *
     * @param name 名称
     * @param price 价格
     */
    public Item(String name,float price) {
        this(name);
        this.price = price;
    }

    /**
     * 重写的 toString 方法
     * 返回格式: 名称 : 价格
     *
     * @return 字符串
     */
    @Override
    public String toString() {
        return this.name + " : " + this.price;
    }

    /**
     * 重写的 equals 方法
     * 比较另一个对象是否是 Item 类型
     * 再判断是否是同一个物品
     * 再判断物品的名称和价格是否相等
     *
     * @param object 对象
     * @return 布尔值
     */
    @Override
    public boolean equals(Object object) {
        // 首先判断 是否是同一个对象
        if (object instanceof Item) {
            // 强制转型判断名称和价格
            if (((Item) object).name.equals(this.name) && ((Item)object).price == this.price) {
                return true;
            }
        }
        return false;
    }

    /**
     * 重写打垃圾回收方法
     * 只是打印了一下呗回收了
     *
     * @throws Throwable 不知道的异常
     */
    @Override
    protected void finalize() throws Throwable {
        super.finalize();
        System.out.println("对象: " + this.toString() + "被回收");
    }
}
```