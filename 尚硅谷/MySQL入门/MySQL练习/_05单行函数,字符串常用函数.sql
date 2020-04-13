-- 测试单行函数
USE myemployees;

-- 字符函数

-- length() 返回当前字符串 的字节个数
/*
如果是中文,则每个字符的长度为 3
/根据字符集
*/	
SELECT LENGTH('size');
SELECT LENGTH('我很快乐');

-- CONCAT() 拼接字符
SELECT 
	CONCAT(last_name,'_',first_name) AS 姓名
FROM
	employees;
	
-- UPPER() & LOWER() 转换大小写
SELECT UPPER('test');
SELECT LOWER('TEST');

/*
测试,将姓变成大写,将名变成小写
	嵌套函数
*/
SELECT
	CONCAT(UPPER(last_name),'_',LOWER(first_name)) AS 姓名
FROM
	employees;
	
-- substring() 截取字符
/*
sql 中,索引从 1 开始
*/
-- 1. 传入字符索引,截取往后的字符串
SELECT SUBSTRING('测试索引查询',5);
-- 2. 传入两个字符索引和长度,截取之间的字符串
SELECT SUBSTRING('测试索引查询',3,2);

-- 将姓名中首字母大写,其他字符小写
SELECT
	CONCAT(
		UPPER(
			SUBSTRING(last_name,1,1)
		),
		LOWER(
			SUBSTRING(last_name,2)
		),
		first_name
	) AS 姓名
FROM
	employees;
	
-- INSTR 返回子串 第一次出现的索引,如果找不到,返回 0
SELECT INSTR('测试字符串','字符串') AS out_put;

-- trim 去除字符串中指定的首位字符,如果没有指定,则默认去除空格
SELECT TRIM('      测试字符串    ') AS out_put;

-- 去除字符串中的指定字符
/*
使用 '字符' from '字符串' 指定
*/
SELECT TRIM('a' FROM 'aaaaaaaaaaaaaaa测试aaa字符串aaaaaaaaaaaa') AS out_put;

-- lpad 左填充,用指定的字符,填充指定的长度
SELECT LPAD('测试字符串',10,'*') AS out_put;

-- rpad 右填充,同上,实现右填充
SELECT RPAD('测试字符串',10,'*');

-- replace 替换字符串,替换所有
SELECT REPLACE(
	'测试字符串,字符串',
	'字符串',
	'数值型'
) AS out_put;

-- 数学函数
/*
类似于 Java 中的 数学类 Math
*/

-- 1. round 四舍五入

-- float 数值
-- 对小数进行四舍五入
SELECT ROUND(1.65);

-- 传入一个位数,小数点后保留的位数
SELECT ROUND(1.567,2);

-- 2. ceil 向上取整
/*
返回 >= 该参数的最小整数
*/
SELECT CEIL(1.000002);

-- 3. floor 向下取整
SELECT FLOOR(1.3);

-- truncate 截断
SELECT TRUNCATE(3.1415926535,2);

-- 4. mod 取模
SELECT MOD(10,3);

-- 日期函数
/*
参数类型为日期类型
*/

-- 1. now 返回当前系统日期和时间
SELECT NOW();

-- 2. curdate 返回当前系统日期,不包含时间
SELECT CURDATE();

-- 3. curtime 返回当前时间,不包含日期
SELECT CURTIME();

