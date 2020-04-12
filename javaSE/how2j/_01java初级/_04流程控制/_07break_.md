# 结束外部循环
> break只是结束了当前循环,并不能结束外部循环

## 使用 boolean 变量
```java
// 结束外部循环的变量
boolean flag = false;
for(int i = 0; i < 10; i ++) {
    for(int j = 0; j < 10; j ++) {
        if (0 == j % 2) {
            // 结束当前循环之后,直接结束外部循环
            flag = true;   
            break;
        }
    }
    if (flag) {
        break;
    }
}
```

## 使用 break 标签
```java
// 此处标签名称可以自定义
export:
for(int i = 0; i < 10; i ++) {
    for(int j = 0; j < 10; j ++) {
        if (0 == j % 2) {
            break;
        }
    }
}
```