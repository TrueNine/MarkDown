-- 分组函数
USE myemployees;
/*
用作统计使用,又称为聚合函数,组函数(传入一组值,统一处理,得到一个结果)

要点:
	1. 分组函数参数类型可以是任意类型
		但不建议
		sum,avg 只建议使用数值型
		max,min 可以使用别的类型,只要能排序
		count 只是计算非空的个数,所有都可以
	2. 列出的分组函数,都不会计算 NULL值
	3. 可以和 distenct 搭配使用,实现去重运算
		SELECT COUNT(DISTENCT salary) FROM employees;
	4. 和分组函数一同查询的字段,要求是: group by  后的字段,或者分组函数

一些常见的分组函数:
	SUM 求和
	AVG 平均值
	MAX 最大值
	MIN 最小值
	COUNT 总数量
*/
-- 测试分组函数
SELECT
	SUM(salary) AS 工资总和,
	AVG(salary) AS 工资平均值,
	MAX(salary) AS 工资最大值,
	MIN(salary) AS 工资最小值,
	COUNT(salary) AS 拥有工资的人数
FROM
	employees;
	
-- 测试嵌套分组函数
SELECT
	SUM(salary) AS 工资总和,
	TRUNCATE(AVG(salary),2) AS 工资平均值,
	MAX(salary) AS 工资最大值,
	MIN(salary) AS 工资最小值,
	COUNT(salary) AS 拥有工资的人数
FROM
	employees;
	
-- count() 要点

-- 统计行数
SELECT
	COUNT(*) AS 数据库表行数
FROM
	employees;
-- 第二种方式
SELECT
	COUNT(1) AS 数据库表行数
FROM
	employees;
	
