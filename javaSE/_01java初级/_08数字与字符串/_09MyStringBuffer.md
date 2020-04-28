# 答案

```java
package cn.how2j;

import cn.how2j.interfaces.MyStringBuffer;

/**
 * how2j的 MyStringBuffer 练习
 * 作为一部分工具类使用
 * 内部维护一个字符数组
 * 字符数组拥有冗余
 *
 * @author 彭继工
 * @date 2020-03-10:12:32
 */
public class YzdzStringBuffer implements MyStringBuffer {

    /** 内容索引 */
    private int size;
    /** 数组当前长度索引 */
    private int arrayIndex;
    /** 默认追加数组长度索引 */
    private int defaultArrayIndex = 64;
    /** 维护的数组 */
    private char[] value;

    /**
     * 空构造器
     * 初始化内容字符数组为默认长度
     * 初始化内容指针为 0
     * 初始化默认追加长度为 64
     * 初始化真实数组长度为 正确值
     *
     */
    public YzdzStringBuffer() {
        value = new char[defaultArrayIndex];
        this.setArrayIndex();
    }

    /**
     * 重载构造器
     * 初始化默认追加长度为 length
     * 不能小于 0 或 负数
     * 初始化 真实数组长度 为 正确长度
     *
     * @param length 追加长度
     */
    public YzdzStringBuffer(int length) {
        if (0 >= length) {
            throw new RuntimeException("长度不能为 0");
        }
        defaultArrayIndex = length;
        value = new char[defaultArrayIndex];
        this.setArrayIndex();
    }

    /**
     * 将传入的字符串转换为字符数组
     * 懒得写 String.toCharArray()
     *
     * @param str 字符串
     * @return char[]
     */
    private static char[] toCharArray(String str) {
        return str.toCharArray();
    }

    /**
     * 设置当前数组长度为正确长度
     * 每次改变记得调用
     */
    private void setArrayIndex() {
        arrayIndex = value.length;
    }

    /**
     * 判断方法
     * 判断是否需要新建数组
     *
     * @param strLength 冗余长度
     */
    private void isNewArray(int strLength) {
        if ((strLength + size) >= arrayIndex) {
            this.newArray(strLength);
        }
    }

    /**
     * 用于创建新的数组
     *
     * @param length 长度
     */
    private void newArray(int length) {
        char[] newCharArray = new char[length + size + defaultArrayIndex];
        System.arraycopy(value,0,newCharArray,0,value.length);
        value = newCharArray;
        this.setArrayIndex();
    }

    /**
     * 判断一个数是否不是 0 和负数
     * 以及是否超出了范围
     *
     * @param number 数值,(可变参数)
     * @return boolean
     */
    private boolean isOutIndex(int... number) {
        boolean flag = false;
        for (int temp : number) {
            if (0 > temp || temp > size) {
                flag = true;
                throw new RuntimeException("超出范围");
            }
        }
        return false;
    }

    /**
     * 在字符串尾部追加字符串
     *
     * @param str 字符串
     */
    @Override
    public void append(String str) {
        char[] tempCharArray;
        if (null == str || "".equals(str)) {
            return;
        } else {
            tempCharArray = str.toCharArray();

            for (int i = 0; i < tempCharArray.length; i++) {
                append(tempCharArray[i]);
            }
        }
    }

    /**
     * 在字符串的尾部追加字符
     *
     * @param c 字符
     */
    @Override
    public void append(char c) {
        this.isNewArray(1);
        value[size] = c;
        size ++;
    }

    /**
     * 根据索引位置插入字符
     *
     * @param pos 索引
     * @param b   字符
     */
    @Override
    public void insert(int pos, char b) {
        insert(pos,String.valueOf(b));
    }

    /**
     * 在指定索引位置插入字符
     *
     * @param pos 索引
     * @param b   字符串
     */
    @Override
    public void insert(int pos, String b) {
        this.isNewArray(b.length());
        boolean is = this.isOutIndex(pos);

        char[] strValue = b.toCharArray();
        int valueLength = strValue.length;

        if (size + valueLength > value.length) {
            char[] temp = new char[valueLength + defaultArrayIndex];

            System.arraycopy(value,0,temp,0,pos);
            System.arraycopy(value,pos,temp,pos,size);
            value = temp;
        } else {
            System.arraycopy(value,pos,value,pos + valueLength, size - pos);
        }

        for (int i = pos,counter = 0; counter < strValue.length; i++,counter ++) {
            value[i] = strValue[counter];
        }
        this.setArrayIndex();
        size += valueLength;
    }

    /**
     * 删除从索引开始的余下字符串
     *
     * @param start 索引
     */
    @Override
    public void delete(int start) {
        delete(start,size);
    }

    /**
     * 删除指定位置之间的字符串
     *
     * @param start 开始位置
     * @param end   结束位置
     */
    @Override
    public void delete(int start, int end) {
        boolean is = isOutIndex(start,end);
        if (start > end) {
            throw new RuntimeException("开始段大于结束段");
        }
        // 如果正好删除的是全部,则清空
        if (0 == start && end == size) {
            clear();
            return;
        }

        System.arraycopy(value,end,value,start, size);

        setArrayIndex();
        size -= (end - start);
    }

    /**
     * 用于清空所有内容
     * 并且创建一个新的 默认长度数组
     */
    private void clear() {
        value = new char[defaultArrayIndex];
        setArrayIndex();
        size = 0;
        return;
    }

    /**
     * 反转字符串
     * 根据 size / 2 反转
     */
    @Override
    public void reverse() {
        // 代码规范,循环不能直接写值
        int two = 2;
        for (int i = 0; i < size / two; i++) {
            char temp =  value[i];
            value[i] = value[size - i];
            value[size - i] = temp;
        }
    }

    /**
     * 返回字符串的长度
     *
     * @return int
     */
    @Override
    public int length() {
        return this.size;
    }

    /**
     * 重写的 toString 方法
     * 直接返回该类的字符串
     *
     * @return String
     */
    @Override
    public String toString() {
        if (0 == size) {
            return "null";
        }
        char[] strArr = new char[size];
        System.arraycopy(value, 0, strArr, 0, size);
        return new String(strArr);
    }

    /**
     * 测试方法,受保护
     * 用于打印一些信息
     *
     * @return String
     */
    public String test() {
        return "{ "
                + "size: " + this.size
                + "; value.length: " + this.arrayIndex
                + "; }";
    }
}
```