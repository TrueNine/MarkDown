-- 分组函数测试
USE myemployees;

-- 1. 查询公司员工工资的最大值，最小值，平均值，总和 
SELECT
	MAX(salary) AS 工资最大值,
	MIN(salary) AS 工资最小值,
	TRUNCATE(AVG(salary),2) AS 工资平均值,
	SUM(salary) AS 工资总和
FROM
	employees;
	
-- 	2. 查询员工表中的最大入职时间和最小入职时间的相差天数 （DATEDIFF)
SELECT
	DATEDIFF(MAX(hiredate),MIN(hiredate)) AS 相差天数,
	MAX(hiredate) AS 最大时间,
	MIN(hiredate) AS 最小时间
FROM
	employees;
	
-- 3. 查询部门编号为 90 的员工个数 
SELECT
	COUNT(*)
FROM
	employees
WHERE
	department_id = 90;