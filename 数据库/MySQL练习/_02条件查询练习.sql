USE myemployees;

-- 1. 员工工资大于 12000 的员工姓名和工资
SELECT
	CONCAT(last_name,first_name) AS 员工姓名,
	salary AS 工资
FROM
	employees
WHERE
	salary > 12000;
	
-- 2. 查询员工号为 176 的员工的姓名和部门号和年薪
SELECT
	CONCAT(last_name,first_name) AS 员工姓名,
	job_id AS 部门编号,
	salary * 12 AS 年薪
FROM
	employees
WHERE
	employee_id = 176;
	
-- 3. 选择工资不在 5000 到 12000 的员工的姓名和工资
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	salary AS 工资
FROM
	employees
WHERE
	NOT (salary BETWEEN 5000 AND 12000);
	
-- 4. 选择在 20 或 50 号部门工作的员工姓名和部门号
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	department_id AS 部门编号
FROM
	employees
WHERE
	department_id IN(20,50);
	
-- 5. 选择公司中没有管理者的员工姓名及 job_id 
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	job_id AS 职位
FROM
	employees
WHERE
	manager_id IS NULL;
	
-- 6. 选择公司中有奖金的员工姓名，工资和奖金级别 
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	salary AS 工资,
	commission_pct AS 奖金级别
FROM
	employees
WHERE
	commission_pct IS NOT NULL;
	
-- 7. 选择员工姓名的第三个字母是 a 的员工姓名
SELECT
	CONCAT(last_name,first_name)
FROM
	employees
WHERE
	CONCAT(last_name,first_name) LIKE '__a%';
	
-- 8. 选择姓名中有字母 a 和 e 的员工姓名
SELECT
	CONCAT(last_name,first_name)
FROM
	employees
WHERE
	CONCAT(last_name,first_name) LIKE '%a%'
		AND CONCAT(last_name,first_name) LIKE '%e%';
		
-- 9. 显示出表 employees 表中 first_name 以 'e'结尾的员工信息
SELECT
	*
FROM
	employees
WHERE
	first_name LIKE '%e';
	
-- 10. 显示出表 employees 部门编号在 80-100 之间 的姓名、职位
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	job_id AS 职位,
	department_id AS 部门编号
FROM
	employees
WHERE
	department_id BETWEEN 80 AND 100;
	
-- 11. 显示出表 employees 的 manager_id 是 100,101,110 的员工姓名、职位 
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	job_id AS 职位,
	manager_id
FROM
	employees
WHERE
	manager_id IN(100,101,110);