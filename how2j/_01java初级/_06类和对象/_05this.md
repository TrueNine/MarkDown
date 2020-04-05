# this
> 即 "我" 的意思

## this 指代当前对象

```java
// 构造器,访问当前对象的一些属性
public Hero(String heroName, float heroHp, float heroArmor, int heroMoveSpeed) {
    this.name = heroName;
    this.hp = heroHp;
    this.armor = heroArmor;
    this.moveSpeed = heroMoveSpeed;
}
```

## 通过 this 访问属性

```java
// 构造器,访问当前对象的一些属性
public Hero(String heroName, float heroHp, float heroArmor, int heroMoveSpeed) {
    this.name = heroName;
    this.hp = heroHp;
    this.armor = heroArmor;
    this.moveSpeed = heroMoveSpeed;
}
```

## 通过 this 调用其他的构造方法

```java
// 填入对应参数,调用其他构造方法
this();
```

# 练习 构造方法 this

```text
参考练习-构造方法 设计一个构造方法,但是参数名称不太一样，分别是 
String name
float hp
float armor
int moveSpeed

不仅如此，在这个构造方法中，调用这个构造方法
 
public Hero(String name,float hp)
```

## 答案

```java

```