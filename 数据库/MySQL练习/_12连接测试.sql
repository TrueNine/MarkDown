-- sql 92测试
USE myemployees;

-- 1. 显示所有员工的姓名，部门号和部门名称
SELECT
	e.last_name AS 员工姓名,
	e.department_id AS 部门编号,
	d.department_name AS 部门名称
FROM
	employees AS e,
	departments AS d
WHERE
	e.department_id = d.department_id;
	
-- 2. 查询90号部门员工的job_id和90号部门的location_id
SELECT
	e.last_name,
	e.job_id,
	d.location_id
FROM
	employees AS e,
	departments AS d
WHERE
	e.department_id = d.department_id
		AND e.department_id = '90';
		
-- 3. 选择所有有奖金的员工的 last_name , department_name , location_id , city
SELECT
	e.last_name,
	d.department_name,
	d.location_id,
	l.city,
	e.commission_pct
FROM
	employees AS e,
	departments AS d,
	locations AS l
WHERE
	e.commission_pct IS NOT NULL
		AND e.department_id = d.department_id
			AND d.location_id = l.location_id;
			
-- 选择city在Toronto工作的员工的 last_name , job_id , department_id , department_name
SELECT
	e.last_name,
	e.job_id,
	e.department_id,
	d.department_name
FROM
	locations AS l,
	employees AS e,
	departments AS d
WHERE
	l.city = 'Toronto'
		AND e.department_id = d.department_id
			AND d.location_id = l.location_id;
			
-- 5.查询每个工种、每个部门的部门名、工种名和最低工资
SELECT
	d.department_name,
	j.job_title AS 工种名,
	MIN(e.salary)
FROM
	employees AS e,
	jobs AS j,
	departments AS d
WHERE
	e.department_id = d.department_id
		AND e.job_id = j.job_id
GROUP BY
	d.department_name,job_title;
	
-- 6.查询每个国家下的部门个数大于2的国家编
SELECT
	COUNT(*) AS 员工个数,
	l.country_id
FROM
	locations AS l,
	departments AS d
WHERE
	l.location_id = d.location_id
GROUP BY
	l.country_id
HAVING
	COUNT(*) > 2;
	
/*
7. 选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格式
employees Emp# manager Mgr#
kochhar 101 king 100
*/
SELECT
	e.employee_id AS 员工编号,
	e.last_name AS 员工姓名,
	m.last_name AS 领导姓名,
	m.employee_id AS 领导编号
FROM
	employees AS e,
	employees AS m
WHERE
	e.manager_id = m.employee_id;
	
SELECT CEIL(RAND() * 100) + 1;