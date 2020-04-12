# super 关键字
> 实例化子类,父类的构造器(无参)一定回被调用

* 使用 super 调用父类构造器```super();```
> super 总在构造器的第一句,不管写上与否

* 使用 super 调用父类属性 ```super.xxx```
* 使用 super 调用父类方法 ```super.method();```

## super 调用父类构造器

* 如果父类显式提供两个构造器,使用 ```super();``` 调用带参构造器

# 练习 super

```text
父类Hero提供了一个有参的构造方法:
```
```java
public Hero(String name){
	this.name = name;
}
```
```text
但是没有提供无参的构造方法
子类应该怎么处理？ 
```
```java
package charactor;
   
public class Hero {
    public String name; 
    protected float hp; 
   
    public Hero(String name){
        this.name = name;
    }
     
//    故意不提供无参的构造方法
//    public Hero(){
//      
//    }
     
    public static void main(String[] args) {
     
    }
       
}
```

## 答案 理解

```text
如果父类没有显式提供构造器
	则会编译异常
必须 在 构造方法内,使用 super();,调用父类带参构造
```
> 建议: 每个类,都写上空构造器