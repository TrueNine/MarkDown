-- 测试 排序数据

USE myemployees;

-- 1. 查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序 
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	department_id AS 部门编号,
	salary * 12 * (1 + IFNULL(commission_pct,0)) AS 年薪
FROM
	employees
ORDER BY
	年薪 DESC,
	姓名 ASC;
	
-- 2. 选择工资不在 8000 到 17000 的员工的姓名和工资，按工资降序
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	salary AS 工资
FROM
	employees
WHERE
	NOT
		(salary BETWEEN 8000 AND 17000)
ORDER BY
	salary DESC;
	
-- 3. 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序 
SELECT
	last_name AS 员工姓,
	email AS 邮箱,
	LENGTH(email) AS 邮箱字符长度,
	department_id AS 部门编号
FROM
	employees
WHERE
	email LIKE '%e%'
ORDER BY
	LENGTH(email) DESC,
	department_id ASC;