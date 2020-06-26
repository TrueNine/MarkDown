# Calendar
> 通过单例获取对象

```java
Calendar c = calendar.getInstance();
```

## 与 Date 相互转换

```java
Date d = c.getTime();
c.setTime(d);
```

## 翻日历

```java
// 设置年(去年的今天)
c.add(Calendar.YEAR, - 1);

// 上个月的第三天
c.add(Calendar.DAY,3);
```

# 练习 Calendar

```text
找出下个月的倒数第3天是哪天 
```

## 答案

```java
package cn.how2j._01java初级._09日期._03Calendar.Exercise;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 练习
 * 找出下个月的第三天
 *
 * @author 彭继工
 * @date 2020-03-14:17:35
 */
public class LastMonthtoDay {

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd: a HH:mm:ss");

    public static void main(String[] args) {
        // 创建一个 Calendar 引用
        Calendar c = Calendar.getInstance();
        // 获取当前时间
        Date d = new Date(System.currentTimeMillis());
        c.setTime(d);

        // 翻到下个月
        c.add(Calendar.MONTH,1);
        c.set(Calendar.DATE,1);
        c.add(Calendar.DATE,-3);

        System.out.println(format(c.getTime()));
    }

    private static String format(Date time) {
        return sdf.format(time);
    }
}
```