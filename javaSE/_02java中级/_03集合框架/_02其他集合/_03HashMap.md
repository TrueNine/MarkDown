# HashMap
> HashMap 键值对

```java
HashMap<Number,String> map = new HashMap<>();
map.put(13.3,"测试字符串");

// 通过 key 查找 value
map.get(13.3);
```

## key and value
> 键 和 值 的关系

* key 是唯一的,不可重复的
* value 可以插入相同的 value

# 练习 查找速度比较

```text
准备一个ArrayList其中存放3000000(三百万个)Hero对象，其名称是随机的,格式是hero-[4位随机数]
hero-3229
hero-6232
hero-9365
...

因为总数很大，所以几乎每种都有重复，把名字叫做 hero-5555的所有对象找出来
要求使用两种办法来寻找
1. 不使用HashMap，直接使用for循环找出来，并统计花费的时间
2. 借助HashMap，找出结果，并统计花费的时间 
```

## 答案
> 不做了

```text
hashMap 使用了 hash 操作
    直接查找对应的hash即可
        所以速度相对很快
```