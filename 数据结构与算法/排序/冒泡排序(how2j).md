# 冒泡排序
> 来自 how2j.cn/数组/排序

## 示例

```java
for (int w = 0; w < b.length; w++) {
    for (int n = 0; n < b.length - w - 1; n++) {
        if (b[n] > b[n + 1]) {
            int temp = b[n];
            b[n] = b[n + 1];
            b[n + 1] = temp;
        }
    }
}
```

## 改良方式

```java
for (int w = 0; w < b.length; w++) {
    boolean flag = true;
    for (int n = 0; n < b.length - w - 1; n++) {
        if (b[n] > b[n + 1]) {
            int temp = b[n];
            b[n] = b[n + 1];
            b[n + 1] = temp;

            // 每次换完就将布尔变量设置为 false
            flag = false;
        }
        if (flag) {
            break;
        }
    }
}
```