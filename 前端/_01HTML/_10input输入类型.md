# input 输入类型

>   均为 ```<input type="XXX" />``` 内的值

*   text  输入文本
*   password  输入密码
*   submit  提交按钮,**提交到 form 的 action 指定地址 ?**
*   radio  单选按钮,(name属性一致,为一组)
*   checkboe  复选框,name一致为一组
*   button  按钮

## 常用的输入限制

| 属性      | 描述                               |
| :-------- | :--------------------------------- |
| disabled  | 规定输入字段应该被禁用。           |
| max       | 规定输入字段的最大值。             |
| maxlength | 规定输入字段的最大字符数。         |
| min       | 规定输入字段的最小值。             |
| pattern   | 规定通过其检查输入值的正则表达式。 |
| readonly  | 规定输入字段为只读（无法修改）。   |
| required  | 规定输入字段是必需的（必需填写）。 |
| size      | 规定输入字段的宽度（以字符计）。   |
| step      | 规定输入字段的合法数字间隔。       |
| value     | 规定输入字段的默认值。             |

## h5 增加的输入类型

*   number  输入数值

*   date  包含日期的输入字段

    *   加入限制的日期

        *   ```html
            <form>
                Enter a date before 1980-01-01:
                <input type="date" name="bday" max="1979-12-31"><br>
                Enter a date after 2000-01-01:
                <input type="date" name="bday" min="2000-01-02"><br>
            </form>
            ```

*   color  颜色

*   range  滑块

    *   ```html
        <form>
            <input type="range" name="points" min="0" max="10">
        </form>
        ```

*   month  输入年月

*   week  输入周年

*   time  选择时间,无时区

*   datetime  选择日期时间,有时区

*   datetime-local  选择日期时间,无时区

*   email  包含电子邮件的输入字段

*   search  搜索字段,类似 text,带一把叉

*   tel  用于输入电话(只有苹果支持?)

*   url  用于输入 url 链接

