# input 属性

*   value  规定用户的 **初始值**
*   readonly **规定为只读属性**?,没有值
*    disable  规定 **不能使用,不提交**,没有值
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