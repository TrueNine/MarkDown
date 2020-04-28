# Properties

>   属于 HashTable 的子类
>
>   1.  用于处理属性文件,**key,value**,都是String类型
>   2.  存取建议使用 getProperty(String key,String value),和 get(Stirng key)

## 常用方法

| 方法        | 传参            | 返回   | 注释                         |
| ----------- | --------------- | ------ | ---------------------------- |
| load        | FileInputStream |        | 加载流对应的文件             |
| getproperty | String key      | String | 得到指定 key 的 value String |

