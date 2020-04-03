# 选择排序

```java
for (int w = 0; w < a.length; w++) {
    for (int n = w; n < a.length; n++) {
        if (a[w] > a[n]) {
            int temp = a[n];
            a[n] = a[w];
            a[w] = temp;
        }
    }
}
```