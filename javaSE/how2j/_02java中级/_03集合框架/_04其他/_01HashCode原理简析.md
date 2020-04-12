# HashCode原理
> 一种算法,不可逆

## List 和 HashMap 的性能比较

* List: 进行挨个比较,直到找到相应的值
* HashMap: 计算hashcode,根据 hashcode 找到对应的数组下标

## hashMap 原理简析

### 插入数据

1. 存入数据,将数据进行hashcode计算
2. 查看数组索引位置是否存在内容
3. 如果存在则 equals 比较,不存在则直接放入数据
4. equals 进行比较,如果存在则在该位置建立链表,追加上该数据

### 查找数据

1. 计算 查找内容的 hashCode,将 hashcode 传入进行判断
2. 如果该 hashcode 索引位置,存放的是内容则直接返回,如果是链表则逐个 equals 比对
3. 如果 equals 存在则返回该数据,equals不存在,则该数据不存在
4. 以上条件都不符合则不存在

## HashSet 判断是否重复
> 内部包装了一个 HashMap

1. 该 Map 只存放 key, value 存放了一个默认的值(值可以重复)
2. 进入时判断 hashCOde 是否一致,不一致存入不同的位置
3. hashCOde 一致,则 equals 比对
4. equals 不一致则不重复, equals 一致则表示该数据重复

# 练习 自定义字符串的 hashCode

```text
如下是Java API提供的String的hashcode生成办法；
 
s[0]*31^(n-1) + s[1]*31^(n-2) + ... + s[n-1]
 

s[0] 表示第一位字符
n表示字符串的长度
本练习并不是要求去理解这个算法，而是自定义一个简单的hashcode算法，计算任意字符串的hashcode
因为String类不能被重写，所以我们通过一个静态方法来返回一个String的hashcode
 
public static int hashcode(String)
 

如果字符串长度是0，则返回0。
否则： 获取每一位字符，转换成数字后，相加，最后乘以23
 
(s[0]+ s[1] + s[2] + s[3]+ s[n-1])*23.
 

如果值超过了1999，则取2000的余数，保证落在0-1999之间。
如果是负数，则取绝对值。

随机生成长度是2-10的不等的100个字符串，打印用本hashcode获取的值分别是多少 
```

## 答案

```java
package cn.how2j._02java中级._03集合框架._04其他._01HashCode原理.Exercise;

import org.junit.Test;

/**
 * 练习: 自定义 String 的 HashCode
 * 根据算式自定义 hashCode
 *
 * @author 彭继工
 * @version 1.0
 * @date 2020-03-28:14:14
 */
public class StringHashCode {
    public static void main(String[] args) {

    }

    @Test
    public void test() {
        // 测试数据
        int length = hash("我日");
        System.out.println(length);
    }

    /**
     * 计算 hashcode
     *
     * @param str 字符串
     * @return hashCode 值
     */
    public static int courtyard = 2000;
    public static int hash(String str) {
        // 将传入的值改变为 字符数组
        char[] cs = str.toCharArray();

        // 将所有的值相加
        int max = 0;
        for (int i = 0; i < cs.length; i++) {
            max += cs[i];
        }
        max *= 23;
        max %= courtyard;
        

        return max;
    }
}
```

# 练习 MyHashMap

```text
根据前面学习的hashcode的原理和自定义hashcode, 设计一个MyHashMap，实现接口IHashMap

MyHashMap内部由一个长度是2000的对象数组实现。

设计put(String key,Object value)方法
首先通过上一个自定义字符串的hashcode练习获取到该字符串的hashcode,然后把这个hashcode作为下标，定位到数组的指定位置。 
如果该位置没有数据，则把字符串和对象组合成键值对Entry，再创建一个LinkedList，把键值对，放进LinkedList中，最后把LinkedList 保存在这个位置。
如果该位置有数据，一定是一个LinkedList,则把字符串和对象组合成键值对Entry，插入到LinkedList后面。

设计 Object get(String key) 方法
首先通过上一个自定义字符串的hashcode练习获取到该字符串的hashcode,然后把这个hashcode作为下标，定位到数组的指定位置。 
如果这个位置没有数据，则返回空
如果这个位置有数据，则挨个比较其中键值对的键-字符串，是否equals，找到匹配的，把键值对的值，返回出去。找不到匹配的，就返回空 
```

### 接口
```java
package collection;
public interface IHashMap {
    public void put(String key,Object object);
    public Object get(String key);
}
```

### 键值对

```java
package collection;
 
//键值对
package collection;
 
//键值对
public class Entry {
 
    public Entry(Object key, Object value) {
        super();
        this.key = key;
        this.value = value;
    }
    public Object key;
    public Object value;
    @Override
    public String toString() {
        return "[key=" + key + ", value=" + value + "]";
    }
     
}
```

## 答案 理解

```text
1. 包装方法
    在如下代码中,写多了 if 会降低可读性
        JDK的处理是包装另一个方法
            使用三元表达式
    在如下的 hash 有体现

实现思想
    使用一个链表数组作为核心
    为空创建新链表,追加在其后
    不为空比较元素,相同则覆盖,不同则追加
    get 同理
```

```java
package cn.how2j._02java中级._03集合框架._04其他._01HashCode原理.Exercise;

import java.util.LinkedList;

/**
 * 练习 实现 MyHashMap
 *
 * @author 彭继工
 * @version 1.0
 * @date 2020-03-28:14:31
 */
public class MyTest{
    public static void main(String[] args) {
        // 测试
        MyHashMap map = new Empty(100);

        // 插入数据
        map.put("我",new Object());
        map.put("日",new Object());
        map.put("日",new Object());

        // 测试查找数据
        System.out.println(map.get("我"));
        System.out.println(map.get("日"));
    }
}

/**
 * MyHashMap 接口
 */
interface MyHashMap {
    /**
     * 往容器内加入数据
     * String 作为 key
     * Object 作为 value
     *
     * @param key   键 String
     * @param value 值 Object
     * @return 是否重复
     */
    boolean put(String key, Object value);

    /**
     * 根据 传入的 key
     * 返回对应的 value
     * 如果重复了,进行 equals 比较
     * 返回该对象的值
     *
     * @param key 键
     * @return 内容
     */
    Object get(String key);
}

/**
 * 实现上接口
 */
class Empty implements MyHashMap {

    /**
     * 核心数组
     * 存放内容为链表
     * 该链表保存了
     */
    LinkedList<Element>[] value;

    /**
     * 空构造器
     * 初始化 maxHash 为 1024
     */
    Empty() {
        this(1024);
    }

    /**
     * 带参构造器
     * 初始化 maxHash 的长度
     *
     * @param maxHash 哈希范围
     */
    Empty(int maxHash) {
        this.maxHash = maxHash;
        this.value = new LinkedList[this.maxHash];
    }

    @Override
    public boolean put(String key, Object value) {
        // 计算 hashcode
        int hashcode = hash(key);
        boolean is = false;

        // 判断该位置是否已经存在链表,不存在则创建
        LinkedList<Element> list = this.value[hashcode];
        if (null == list) {
            list = new LinkedList<>();
            this.value[hashcode] = list;
            list.add(new Element(key,value));
            return false;
        }

        // 判断 key 是否存在
        for (Element temp : list) {
            // 如果已经存在则替换
            if (key.equals(temp.getKey())) {
                is = true;
                temp.setValue(value);
                break;
            } else {
                // 不存在则追加在链表的后方
                Element e = new Element(key,value);
                list.add(e);
            }
        }
        return is;
    }

    @Override
    public Object get(String key) {
        // 进行 hashCode 运算
        int hashcode = hash(key);

        // 定义返回的临时变量
        Element result = null;
        // 判断该位置是否有值
        LinkedList<Element> list = this.value[hashcode];
        if (null == list) {
            throw new RuntimeException("该 key 不存在");
        } else {
            boolean is = true;
            for (Element temp : list) {
                if (key.equals(temp.getKey())) {
                    result = temp;
                    is = false;
                }
            }
            if (is) {
                throw new RuntimeException("该 key 不存在");
            }
        }
        return result;
    }

    /**
     * 用于初始化 hash 的计算长度
     * 以及存储的数组长度
     */
    private int maxHash;

    /**
     * 计算 key 的 hashCode
     *
     * @param key String
     * @return hashCode
     */
    private int hash(String key) {
        return 0 == key.length() ? 0 : hash(key.toCharArray());
    }

    /**
     * 计算 hash 的重载方法
     *
     * @param cs 字符数组
     * @return hash
     */
    private int hash(char[] cs) {
        int result = 0;
        for (int i = 0; i < cs.length; i++) {
            result += cs[i];
        }
        result *= 23;
        // 不能取到最大的数组长度,必须 - 1
        result %= (maxHash - 1);
        return result;
    }
}

/**
 * 键值对存储结构
 */
class Element {

    /**
     * 键值对
     */
    private String key;
    private Object value;

    /**
     * 空构造器
     * 初始化 key value 为 null
     */
    Element() {
        this.key = null;
        this.value = null;
    }

    /**
     * 带参构造器
     * 初始化 key 和 value
     *
     * @param key   String
     * @param value Object
     */
    Element(String key, Object value) {
        this.key = key;
        this.value = value;
    }

    /**
     * set get
     */
    public void setKey(String key) {
        this.key = key;
    }
    public String getKey() {
        return key;
    }
    public void setValue(Object value) {
        this.value = value;
    }
    public Object getValue() {
        return value;
    }

    /**
     * 重写的 toString
     *
     * @return [key:xxx value:xxx]
     */
    @Override
    public String toString() {
        return "[key:" + key + " value:" + value + "]";
    }
}
```

# 练习 性能比较
> 不做了