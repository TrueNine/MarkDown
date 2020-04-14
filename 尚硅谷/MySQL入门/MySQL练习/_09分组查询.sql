-- 分组查询
USE myemployees;
/*
语法: 
	SELECT
		分组函数,列(要求出现在 GROUP BY 后面)
	FROM
		表名
	WHERE
		筛选条件
	GROUP BY
		分组列表
	ORDER BY
		排序
		
注意:
	1. 查询的列要求必须出现在 GROUP BY 后面
	
要点:
	1. 分组查询的筛选条件分为:
		分组前筛选
			原始表,放在 GROUP BY 子句的前面,使用 WHERE
		分组后筛选
			分组后的结果集,放在 GROUP BY 子句的后面,使用 HAVING,分组条件肯定是在 HAVING 子句中
				能用分组前筛选的,尽量使用分组前筛选(性能)
				
	2. GROUP BY 支持单个字段筛选,也支持多个字段筛选(使用 , 相隔,没有顺序要求)
			同时也支持:
				函数/表达式
				别名   虽然支持单不建议,因为像 oracle 等是不支持的
	 3. 也可以添加排序,放在整个分组查询的最后
 
*/



-- 简单的分组查询
-- 1. 查询每个工种的最高工资
SELECT
	MAX(salary) AS 工资,
		job_id AS 职位
FROM
	employees
GROUP BY
	job_id
ORDER BY
	工资 DESC,部门 ASC;
	
-- 2. 查询每个位置的部门个数
SELECT
	COUNT(*),
	location_id
FROM
	departments
GROUP BY
	location_id;
	
-- 添加筛选条件
-- 1. 查询邮箱中包含 a 字符的每个部门的平均工资
SELECT
	AVG(salary) AS 部门平均工资,
		department_id AS 部门编号
FROM
	employees
WHERE
	email LIKE '%a%'
GROUP BY
	department_id
ORDER BY
	部门编号 ASC;
	
-- 2. 查询有奖金的每个领导手下员工的最高工资
SELECT
	MAX(salary),
		manager_id
FROM
	employees
WHERE
	commission_pct IS NOT NULL
GROUP BY
	manager_id
ORDER BY
	manager_id ASC;
	


-- 添加复杂的筛选条件
/*
在 GROUP BY 后 使用 HAVING 进行结果集的筛选
*/
-- 1. 查询哪个部门的员工个数 > 2
SELECT
	COUNT(*),
		department_id
FROM
	employees
GROUP BY
	department_id
HAVING
	department_id IS NOT NULL
		AND COUNT(*) > 2
ORDER BY
	COUNT(*) DESC,department_id ASC;
	
-- 2. 查询每个工种,有奖金的员工的最高工资,并且最高工资大于12000的工种编号和最高工资
SELECT
	MAX(salary),
		job_id
FROM
	employees
WHERE
	commission_pct IS NOT NULL
		AND commission_pct >= 0
GROUP BY
	job_id
HAVING
	MAX(salary) > 12000;
	
-- 3. 查询领导编号 > 102 的每个领导手下的最低工资>5000的领导编号是哪个
SELECT
	MIN(salary) AS 最低工资,
		manager_id AS 领导编号
FROM
	employees
WHERE
	manager_id > 102
GROUP BY
	manager_id
HAVING
	MIN(salary) > 5000
ORDER BY
	最低工资 ASC,manager_id ASC;



-- 分组支持表达式/函数
-- 按员工姓名的长度分组,查询每一组员工的个数 > 5 的有哪些
SELECT
	COUNT(*) AS 总数,
		LENGTH(last_name) AS 姓长度
FROM
	employees
GROUP BY
	LENGTH(last_name)
HAVING
	COUNT(*) > 5;
	
	
	
-- 多字段分组
/*

*/
-- 查询每个部门,每个工种的员工平均工资
SELECT
	TRUNCATE(AVG(salary),2) AS 平均工资,
		department_id AS 部门编号,
		job_id AS 工种编号
FROM
	employees
GROUP BY
	department_id,
	job_id;
	
-- 分组查询支持排序
-- 查询每个部门,每个工种的平均工资,并且按照平均工资高低进行排序
SELECT
	TRUNCATE(AVG(salary),2),
		department_id,
		job_id
FROM
	employees
WHERE
	department_id IS NOT NULL
GROUP BY
	department_id,
	job_id
ORDER BY
	AVG(salary) DESC,department_id ASC;
	
	
















































