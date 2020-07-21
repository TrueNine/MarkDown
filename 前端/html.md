# 简介

>   **H**yper **T**ext **M**arkup **L**anguage  **超文本标记语言***
>
>   *   用以描述网页
>   *   包含标签和纯文本
>   *   web浏览器,读取 HTML,解析为网页

## HTML 元素

>   开始标签到结束标签的所有代码,包括单标签 < />
>
>   ```html
>   <!-- 双标签 -->
>   <h1 class='_Test_Class'>
>     测试标签
>   </h1>
>   
>   <!-- 单标签 -->
>   <br id='Test_Java' />
>   ```

### 嵌套元素

>   大多数 标签 可以包含其他标签
>
>   ```html
>   <body>
>      <p>
>          测试的包含关系
>          <a href='https://www.baidu.com'>嵌套了一个超链接</a>
>      </p>
>   </body>
>   ```

### HTML属性

>   属性为标签提供了更多信息,以 key/value 形式出现
>
>   ```html
>   <h1 key='value'>
>      测试
>   </h1>
>   ```



### HTML 一些规范

>   *   标签全部使用小写字母
>   *   属性使用小写字母

### HTML标准格式

```html
<!DOCTYPE html>
<html>
    <head>
        <title>网页标题</title>
        <meta charset="utf-8" />
    </head>
    <body>
        <!-- 注释 -->
        <p>
            在此处书写网页内容
        </p>
    </body>
</html>
```

# 标题标签 ```<h1>  -> <h6>```

>   用以表示网页的标题,从大到小,h1 最大,h6最小
>
>   ```<hr />``` 用于定义分割线

# 段落标签```<p>```

>   用以定义一段文本,但是不会自动换行,需要使用```<br />```
>
>   ```html
>   <p>
>      这是一段测试文本
>   </p>
>   ```

# 代码格式 ```<code>```

>   用以显示计算机代码
>
>   ```html
>   <code>
>   var person = {
>      firstName:"Bill",
>      lastName:"Gates",
>      age:50,
>      eyeColor:"blue"
>   }
>   </code>
>   ```
>
>   *   表示变量的 var
>
>   ```html
>   <var>0xEF</var>
>   ```

# 注释 ```<!---->```

>   用以注释网页内容,浏览器不会理会
>
>   ```html
>   <!-- 浏览器不会解析 -->
>   
>   <!--
>   	也可以写多行注释
>   -->
>   ```

# 链接 ```<a>```

>   表示一个超链接
>
>   *   通过 href 属性指定 超文本(比如百度的连接)
>   *   通过 name 属性指定锚点
>   *   通过 target 属性指定在何处打开网页,一般使用 # 开头命名
>   *   **href 内的链接尾部,加上/,避免两次请求**
>
>   ```html
>   <a href="https://www.baidu.com/" target="_blank">百度的连接</a>
>   ```
>
>   1.  如果将 target 设置为 _blank,会在新的窗口打开此连接
>   2.  如果将 href 属性 设置为 **#xxx**,则会跳转到 name属性为 **#xxx** 的标记
>   3.  将 target 设置为 _top,将 href 设置为 **上一个一个链接,则会回到上一页**

# 图像标签 ```<img>```

>   用以在网页上显示图片
>
>   *   使用 src 属性 指定图片的位置
>   *   使用 width , height 指定宽高,可以使用 px,也可以使用 %(占据当前块的百分比)
>   *   **使用 alt 属性,指定图片不显示的情况下的代替文本**

# 表格标签```<table>```

>   使用 table 定义表,tr定义一行数据,使用 th 定义表头,
>
>   *   如果不定义边框属性,表格默认不现实边框
>
>   **表的书写方式**
>
>   ```html
>   <!DOCTYPE html>
>   <html>
>   	<head>
>   		<!-- 为表 使用 border 显示边框,不建议使用 -->
>   		<meta charset="utf-8">
>   		<title></title>
>   	</head>
>   	<body>
>   		<!-- 这就是基本的书写格式 -->
>   		<!-- 一个 tr 一行数据,th是表头,td为普通数据 -->
>   		<table border='1px'>
>               <caption>表的标题</caption>
>   			<tr>
>   				<th>表头1</th>
>   				<th>表头2</th>
>   				<th>表头3</th>
>   			</tr>
>   			<tr>
>   				<td>第一个数据</td>
>                	<!-- 使用空占位,防止不现实边框 -->   
>   				<td>&nbsp;</td>
>   				<td>第三个数据</td>
>   			</tr>
>   		</table>
>   	</body>
>   </html>
>   ```
>
>   *   如果单元格内没有内容,浏览器不会解析边框,建议加上一个占位符 ```&nbsp;```

# 有序,无序,自定义列表

## 有序列表

>   使用 ul 表示 ,内容包括 li
>
>   ```html
>   <!DOCTYPE html>
>   <html>
>   	<head>
>   		<meta charset="utf-8">
>   		<title></title>
>   	</head>
>   	<body>
>   		<!-- 用于测试无序列表列表 -->
>   		<ul>
>   			<li>第一个表数据</li>
>   			<li>第二个表数据</li>
>   			<li>第三个表数据</li>
>   			<!-- 同时内部可以嵌套ul,显示为子列表 -->
>   			<ul>
>   				<li>内部包含数据</li>
>   			</ul>
>   		</ul>
>   	</body>
>   </html>
>   ```

## 有序列表

>   与无序列表类似,**使用 ol 代替 ul, li 照常使用**
>
>   ```html
>   <!DOCTYPE html>
>   <html>
>   	<head>
>   		<meta charset="utf-8">
>   		<title></title>
>   	</head>
>   	<body>
>   		<!-- 测试有序列表 -->
>   		<ol>
>   			<li>一条数据</li>
>   			<li>一条数据</li>
>   			<li>一条数据</li>
>   			<li>一条数据</li>
>   			<li>一条数据</li>
>   			<!-- 如同无序列表,同样可以嵌套使用 -->
>   			<ol>
>   				<li>内部的一条数据</li>
>   				<li>内部的一条数据</li>
>   			</ol>
>   		</ol>
>   	</body>
>   </html>
>   ```
>
>   *   使用 ```<<caption>``` 标签,来显示表标题

## 自定义列表

>   项目及注释的集合,使用 dl ,注释使用 dt ,内容使用 dd
>
>   ```html
>   <dl>
>      <dt>计算机</dt>
>      <dd>玩游戏</dd>
>      <dd>写代码</dd>
>      <dt>显示器</dt>
>      <dd>显示图像</dd>
>   </dl>
>   ```



# div

>   包含其他 **标签的容器**,会在其后 **显示折行**
>
>   **与** **css** **搭配食用更佳**

# span

>   与 div 一样,没有特定的含义,也是容器
>
>   但是, **span 不会折行,会一直显示下去**

# 框架

>   通过框架,可以在一个窗口,显示多个页面
>
>   **框架不能与 body 共存,如果使用 frameset 则不适用 body**

*   frameset  分割框架 , 定义一系列行和列

    *   **rows** / **cols** 属性规定占据屏幕的面积

*   frame 框架标签,规定放在 set 中的 页面

    *   noresize="noresize" **设置当前界面不可拉动拖拽**

*   添加 noframes 以提示用户

    *   ```html
        <noframes>
        	<body>您的浏览器无法处理框架！</body>
        </noframes>
        ```

### 使用框架分割

>   frameset 同时可以包含其他窗口

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	<noframes>
		<body>
			您的浏览器不支持框架 ! 
		</body>
	</noframes>
	<frameset cols="50%,50%">
		<frame src="https://www.baidu.com/" />
		<frameset rows="50%,50%">
			<frame src="https://www.how2j.cn/" />
			<frame src="https://www.taobao.com/" />
		</frameset>
	</frameset>
</html>
```

# iframe 

>   在网页内显示网页
>
>   ```html
>   <iframe src="https://www.baidu.com/">测试</iframe>
>   ```

*   width , height 设置宽高
*   frameborder 属性: 设置为 0 不现实边框
*   可以给 iframe 设置 **name属性,达到将内容推送至此的目的**

# 文件路径

>   用以描述文件的位置,在链接外部文件时会用

## 绝对路径

>   比如 别的网站的 URL: ```https://www.baidu.com/index.html```

## 相对路径

>   描述指向当前页面的文件
>
>   ```src/index.html```,当前文件夹下的文件路径
>
>   *   ../  上一级文件
>
>   **使用相对路径是个好习惯**

# 头部 head

>   包含一些高速浏览器的信息
>
>   其中一些常见的标签包括
>
>   *   title  网页显示信息
>   *   meta  网页描述
>   *   base  规定页面内所有链接的  target
>   *   link  链接外部文件,**常用于链接脚本和样式表**
>   *   style  用于书写样式
>   *   script  用于书写脚本

## 实体

>   在HTML 中有些字符有些字符是预留字符
>
>   ​	比如:  >   <  浏览器认为是标签

| 显示结果 | 描述              | 实体名称          | 实体编号     |
| :------- | :---------------- | :---------------- | :----------- |
|          | 空格              | ```&nbsp;```      | ```&#160;``` |
| <        | 小于号            | &lt;              | &#60;        |
| >        | 大于号            | &gt;              | &#62;        |
| &        | 和号              | &amp;             | &#38;        |
| "        | 引号              | &quot;            | &#34;        |
| '        | 撇号              | &apos; (IE不支持) | &#39;        |
| ￠       | 分（cent）        | &cent;            | &#162;       |
| £        | 镑（pound）       | &pound;           | &#163;       |
| ¥        | 元（yen）         | &yen;             | &#165;       |
| €        | 欧元（euro）      | &euro;            | &#8364;      |
| §        | 小节              | &sect;            | &#167;       |
| ©        | 版权（copyright） | &copy;            | &#169;       |
| ®        | 注册商标          | &reg;             | &#174;       |
| ™        | 商标              | &trade;           | &#8482;      |
| ×        | 乘号              | &times;           | &#215;       |
| ÷        | 除号              | &divide;          | &#247;       |



>   用于搜集用户数据

## form

用此定义用户表单,用以包含表单元素,表单元素是不同的 **input 标签**

### form属性

| 属性           | 描述                                                       |
| :------------- | :--------------------------------------------------------- |
| accept-charset | 规定在被提交表单中使用的字符集（默认：页面字符集）。       |
| action         | 规定向何处提交表单的地址（URL）（提交页面）。              |
| autocomplete   | 规定浏览器应该自动完成表单（默认：开启）。                 |
| enctype        | 规定被提交数据的编码（默认：url-encoded）。                |
| method         | 规定在提交表单时所用的 HTTP 方法（默认：GET）。            |
| name           | 规定识别表单的名称（对于 DOM 使用：document.forms.name）。 |
| novalidate     | 规定浏览器不验证表单。                                     |
| target         | 规定 action 属性中地址的目标（默认：_self）。              |

## h5 新增属性

*   autocomplete  输入的字段是否可以自动完成  **on/off**,其他表单元素依然可以使用
*   novalidate  不对提交的数据进行校验

### input

表单内最重要的元素,用不同的 type 属性修饰,来决定元素

*   method:  指定提交时所使用的方式
*   action: 指定表单提交的路径,(web服务器脚本?)
    *   如果不指定,则默认是当前页面

#### input 属性

*   name: 每个输入字段必须有一个name,用于指定提交的内容
    *   name 可以规定单选框处于的一组内容

#### input type 属性值

*   text:  用于输入文本
*   redio:  单选按钮
*   submit:  提交按钮

### fieldset 组合

用于组合表单中相关的数据

*   **legend**  标签用于命名该组合

### select 下拉列表

#### option 可供选择元素

>   默认选择第一个元素

*   value 属性指定了 提交时的值

```html

```

### textarea 文本域

>   用于定义一个多行文本输入框

### button 按钮

>   定义一个可以点击的按钮

```html

```

# h5 新增

>   浏览器不会显示不认识的标签,所以不用担心影响布局

## datalist

>   显示一些默认选择值

```html
<form action="action_page.php">
<input list="browsers">
<datalist id="browsers">
    <option value="Internet Explorer">
    <option value="Firefox">
    <option value="Chrome">
    <option value="Opera">
    <option value="Safari">
</datalist> 
</form>
```

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

# input 属性

*   value  规定用户的 **初始值**
*   readonly **规定为只读属性**?,没有值
*   disable  规定 **不能使用,不提交**,没有值
*   size  规定用户的输入尺寸,个数
*   maxlength  规定用户输入的最大长度,**不会提醒用户,需要脚本支持**,只会提交指定长度字符

# h5新增属性

*   autocomplete  form 自动填写
*   novalidate  form 提交不进行校验
*   autofocus  布尔属性,焦点聚焦于此处
*   **form**  指定表单外的标签,属于哪个表单,**id 使用 空格 分隔**
*   **formaction**  覆盖 form 的 action 属性,提交到不同的地方
    *   适用于 submit 和 image  (type=)
*   **formenctype**  **覆盖 form 的 encty 属性**, 提交到服务器时如何进行编码,**针对 post**
    *   适用于 submit 和 image  (type=)
*   **formmethod**  规定发送的方法
    *   适用于 submit 和 image  (type=)
*   formnovalidate  提交时不进行验证
*   formtarget  **覆盖 form**,如何处理接收到的相应
*   height,width  规定 **image** 的宽高
*   list  指定 **datalist** 的默认项,**id** option
*   min,max  规定最小,最大值
*   multiple  允许用户插入一个以上的值
    *   适用于 **file**,**email**
*   **pattern**  检查 input 的正则表达式
    *   适用于一些输入框
*   **placeholder**  显示一个提示输入,默认灰色那个
*   required  提交之前必须输入字段
*   **step**  规定输入的倍数,**用户只能输入该倍数以内的值**
    *   比如 step="3" ,则 值只能 0,3,6,9..,**搭配 max,min 食用更佳**

# 简述

可扩展超文本标记语言 **EXtensible HyperText Markup Language**

*   更严格的HTML版本
*   是一个标准 (**w3c**)

## 为何使用 xhtml

XHTML 是 XML 与 HTML 的结合

*   所有标记必须正确关闭
*   可以编写出拥有良好风格的HTML

## 不同之处

*   必须正确嵌套元素
*   标签必须关闭
*   标签,属性,必须小写
*   属性必须加 引号
*   属性不能简写
*   **用 id 代替 name 属性**
*   XHTML DTD 定义了强制使用的 HTML 元素
*   必须拥有根标签
*   DOCTYPE 是强制书写的,head,body都是

## 简写列表

| HTML     | XHTML               |
| :------- | :------------------ |
| compact  | compact="compact"   |
| checked  | checked="checked"   |
| declare  | declare="declare"   |
| readonly | readonly="readonly" |
| disabled | disabled="disabled" |
| selected | selected="selected" |
| defer    | defer="defer"       |
| ismap    | ismap="ismap"       |
| nohref   | nohref="nohref"     |
| noshade  | noshade="noshade"   |
| nowrap   | nowrap="nowrap"     |
| multiple | multiple="multiple" |
| noresize | noresize="noresize" |

## XHTML 核心属性

| 属性  | 值                       | 描述                   |
| :---- | :----------------------- | :--------------------- |
| class | class_rule 或 style_rule | 元素的类(class)        |
| id    | id_name                  | 元素的某个特定id       |
| style | 样式定义                 | 内联样式定义           |
| title | 提示文本                 | 显示于提示工具中的文本 |

## 语言属性

以下标签不提供下面的属性：base, br, frame, frameset, hr, iframe, param, 以及 script 元素。

| 属性 | 值         | 描述           |
| :--- | :--------- | :------------- |
| dir  | ltr \| rtl | 设置文本的方向 |
| lang | 语言代码   | 设置语言代码   |

## 键盘属性 (Keyboard Attributes)

| 属性      | 值   | 描述                       |
| :-------- | :--- | :------------------------- |
| accesskey | 字符 | 设置访问某元素的键盘快捷键 |
| tabindex  | 数   | 设置某元素的Tab次序        |