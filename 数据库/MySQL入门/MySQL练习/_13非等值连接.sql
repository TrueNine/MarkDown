-- SQL99 语法
USE myemployees;

/*
连接查询注意的点

等值连接:
	同样可以添加,筛选,分组,排序
	
	筛选条件放在 where , 连接条件放在 on ,提高可读性
	
	和sql92的等值连接效果一样,都是查询多表交集部分
	
	连接是有一定顺序的
		连接条件之间,必须能够 "条件串联"
			如: a.a_id = b.b_id | b.b_id = c.c_id
				不能进行跨区连接
*/

-- 等值连接

-- 查询员工名,部门名
/*
普通查询
*/
SELECT
	e.last_name,
	d.department_name
FROM
	employees AS e
		INNER JOIN departments AS d
			ON e.department_id = d.department_id;
			
-- 查询名字中包含 e 的员工名和工种名
/*
添加筛选条件
*/
SELECT
	e.last_name,
	j.job_title
FROM
	employees AS e
		INNER JOIN jobs AS j
			ON e.job_id = j.job_id
WHERE
	e.last_name LIKE '%e%';
	
-- 查询部门个数 > 3 的城市名和部门个数
/*
添加分组筛选
*/
SELECT
	l.city,
	COUNT(*) AS 部门个数
FROM
	departments AS d
		INNER JOIN locations AS l
			ON d.location_id = l.location_id
GROUP BY	l.city
HAVING
	COUNT(*) > 3;
	
-- 查询哪个部门的员工个数 > 3 的部门名和员工个数,并按个数降序
/*
排序
*/
SELECT
	COUNT(*) AS 员工个数,
	d.department_name AS 部门名称
FROM
	employees AS e
		INNER JOIN departments AS d
			ON e.department_id = d.department_id
GROUP BY
	d.department_name
HAVING
	COUNT(*) > 3
ORDER BY
	COUNT(*) DESC;
	
-- 查询员工名,部门名,工种名,并按部门名排序
/*
三标查询
*/
SELECT
	e.last_name,
	j.job_title,
	d.department_name
FROM
	employees AS e
		INNER JOIN departments AS d
			ON e.department_id = d.department_id
		INNER JOIN jobs j
			ON e.job_id = j.job_id
ORDER BY
	d.department_id DESC;
	
-- 查询员工对应的工资级别
/*
非等值连接
*/
SELECT
	e.last_name,
	e.salary,
	g.grade_level
FROM
	employees AS e
		INNER JOIN job_grades AS g
			ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;
			
-- 查询每个工资级别的员工个数 > 2 的,并且按照个数降序
SELECT
	g.grade_level,
	COUNT(*)
FROM
	employees AS e
		INNER JOIN job_grades AS g
			ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
GROUP BY
	g.grade_level
HAVING
	COUNT(*) > 2
ORDER BY
	COUNT(*) DESC,g.grade_level ASC;
	


-- 自连接

-- 查询姓名包含字符 k 的员工的名称,上级的名称
SELECT
	e.last_name,
	m.last_name
FROM
	employees AS e
		INNER JOIN employees AS m
			ON e.manager_id = m.employee_id
WHERE
	e.last_name LIKE '%k%';