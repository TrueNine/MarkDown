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

-- 4. 获取指定的,年,月,日,时,...
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT MONTHNAME(NOW());
SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());

-- 5. str_to_date 将日期格式的字符,转换为日期类型
/*
类似于 Java 的 SlempDateFormat()
%Y 4位年
%y 2位年
%m 2位月
%c 1位月
%d 日
%H 24小时
%h 12小时
%i 分钟
%s 秒

*/
SELECT STR_TO_DATE('2020/03/04/12:13:45','%Y/%m/%d/%H:%i:%s');

-- 6. date_format() 将字符串转换为日期
SELECT DATE_FORMAT(now(),'%Y,%m,%d/%H:%i:%s');
-- 查询有奖金的员工名,和入职日期(月/日/年)
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	commission_pct as 奖金,
	DATE_FORMAT(hiredate,'%m/%d/%Y') AS 入职日期
FROM
	employees
WHERE
	commission_pct IS NOT NULL
		AND commission_pct <> 0
ORDER BY
	commission_pct DESC,hiredate ASC;
	
	

-- 其他函数

-- 1. version() MySQL 的版本
SELECT VERSION();

-- 2. database() 查看当前的数据库,库
SELECT DATABASE();

-- 3. user() 当前用户
SELECT USER();



-- 流程控制函数

-- 1. if() 判断
SELECT IF(1 > 2,'大','小');
-- 查询是否有奖金
SELECT
	CONCAT(last_name,first_name) as 员工姓名,
	IFNULL(commission_pct,0) as 奖金,
	IF(commission_pct IS NOT NULL,'有','无') AS 是否拥有奖金
FROM
	employees
ORDER BY
	员工姓名 ASC,奖金 DESC;
	
-- case() 类似于 switch
/*
结构为: case when then else
*/
-- 查询员工的工资
/*
如果部门号 = 30 显示工资为 1.1倍
如果部门号 = 40 显示工资为 1.2倍
如果部门号 = 50 显示工资为 1.3倍
其他部门显示为原工资
*/
SELECT
	salary AS 原工资,
	department_id AS 部门编号,
	CASE department_id
		WHEN 30 
			THEN salary * 1.1
		WHEN 40 
			THEN salary * 1.2
		WHEN 50 
			THEN salary * 1.3
		ELSE 
			salary
	END AS 现工资
FROM
	employees;
-- if else 的表达方式
/*
case
when 条件1 then 执行
when 条件2 then 执行
else 执行
end
*/
-- 查询员工的新工资情况
/*
工资 > 20000 显示 A 级别
工资 > 15000 显示 B 级别
工资 > 10000 显示 C 级别
否则 显示 D 级别
*/
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	salary AS 工资,
	CASE
		WHEN salary > 20000
			THEN 'A'
		WHEN salary > 15000
			THEN 'B'
		WHEN salary > 10000
			THEN 'C'
		ELSE 'D'
	END AS 工资级别
FROM
	employees
ORDER BY
	工资级别 ASC,salary DESC;