# 日期格式化
> 以字符串形式操作日期,进行日期格式化
>> ```线程不安全不建议使用```

## 日期表示格式

| 字符 | 表示 |
|:---:|:----:|
| y | year |
| M | month |
| d | day |
| H | 24 hour |
| h | 12 hour |
| m | minute |
| s | second |
| S | millisecond |

### 其他格式

| 字符 | 表示 |
|:---:|:---:|
| a | 显示上下午 |
| E | 显示星期 |
| D | 一年中的第几天 |
| F | 一月中的第几个星期几 |
| w | 一年中的第几个星期 |
| W | 一月中的第几个星期 |
| k | 时 在一天中 24 |
| K | 时 在一天中 12 |

## format
> SimpleDateFormat

```java
// 在构造器设置格式
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd/hh:mm:ss");

// 通过 format 设置时间
sdf.format(new Date(12),"yyyy.......");
```

## parse()
> 字符串设置时间
>> 与设置格式````必须保持一致```

```java
sdf.parse("2012-12-31/13:15:23");
```

# 练习 排序日期(时间0)

```text
准备一个长度是9的日期数组
使用1970年-2000年之间的随机日期初始化该数组
按照这些日期的时间进行升序排序
比如 1988-1-21 12:33:22 就会排在 1978-4-21 19:07:23 前面，因为它的时间更小，虽然日期更大
```

## 答案 理解

```text
使用 Integer.parse() 转换字符串进行比较
    比较 SimpleDateFormat(HHmmss) 的大小
```

```java
package cn.how2j._01java初级._09日期._02SimpleDateFormat.Exercise;

import cn.yzdz.calculate.Time;
import cn.yzdz.outConsole.Print;
import cn.yzdz.random.RandomNumber;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 根据小时进行排序
 *
 * @author 彭继工
 * @date 2020-03-12:20:41
 */
public class SortTime {
    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
        // 生成 9 个随机日期
        Date[] d = new Date[9];
        // 初始化该该时间数组
        for (int i = 0; i < d.length; i++) {
            d[i] = new Date(RandomNumber.randomLong(Time.calculateLeapyear(1940),Time.calculateLeapyear(2000) + Time.calculateLeapyear(1971),true));
        }

        Print<Date> print = new Print<>();
        print.printArray(d,1);

        // 根据时分秒进行排序
        // 冒泡排序
        for (int w = 0; w < d.length; w++) {
            boolean is = true;
            for (int n = 0; n < d.length - w - 1; n++) {
                String beforeStr = sdf.format(d[n]);
                String afterStr = sdf.format(d[n + 1]);

                int be = Integer.parseInt(beforeStr);
                int af = Integer.parseInt(afterStr);

                if (be > af) {
                    Date temp = d[n];
                    d[n] = d[n + 1];
                    d[n + 1] = temp;
                    is = false;
                }
            }
            if(is) {
                break;
            }
        }
        // 打印测试
        System.out.println(Print.line("测试结果"));;
        print.printArray(d,1);
    }
}
```