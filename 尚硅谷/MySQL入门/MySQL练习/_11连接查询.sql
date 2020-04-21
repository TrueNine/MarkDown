	-- 连接查询
USE myemployees;
/*
笛卡尔乘积:
	表1 有 m 行,表2 有 n 行,结果 = m * n 行
	发生: 没有有效的连接条件
	解决: 添加有效的连接条件
		添加连接条件时,使用 表名.字段 进行区分
		
分类:
	年代分类
		SQL92标准
			MySQL中仅仅支持
				内连接
				外连接: 支持一部分,但不太好
		SQL99标准,推荐
			所有内连接,交叉连接
			外连接,不是全部支持,只支持,左右外连接,不支持全外连接 
	功能
		内连接
			等值连接
				第一章表的每一行,根据 等值条件 匹配第二张表
				1. 多表等值连接,为多表的交集部分
				2. n 表连接,至少需要 n - 1 个连接条件
				3. 多表的顺序没有要求
				4. 在多表连接上,建议起别名
				5. 连接可以搭配,所有查询子句使用,排序,分组,筛选
			非等值连接
				在等值连接的基础上,将等值连接的 = ,替换为 其他逻辑运算符
			自连接
				自己连接自己,类似于等值连接,只不过操作的是自己
		外连接
			左外连接
			右外连接
			全外连接
		交叉连接	
*/

-- 测试连接条件
-- 无连接条件,出现笛卡尔乘积现象
SELECT * FROM employees,jobs;
-- 添加连接条件
SELECT
	*
FROM
	employees,
	jobs
WHERE
	employees.job_id = jobs.job_id;
	
	
	
-- 等值连接
/*
表的顺序是可以替换的
*/
-- 将 员工表 和 职位表 的职位想对应
SELECT
	*
FROM
	employees,
	jobs
WHERE
	employees.job_id = jobs.job_id;
	
-- 查询员工名和对应的部门名
SELECT
	CONCAT(last_name,first_name) AS 员工姓名,
	department_name AS 部门名称
FROM
	employees,departments
WHERE
	employees.department_id = departments.department_id;
	
-- 查询员工名,工种号,工种名
/*
如果在表内字段发生歧义,则使用 表名.字段 进行区别
可以为表 起别名
	在表名后,添加 AS 别名,建议别名简短
		使用了别名, 再去使用 表名.字段 就不好用了
*/
SELECT
	last_name,
	employees.job_id,
	job_title
FROM
	employees,
	jobs
WHERE
	employees.job_id = jobs.job_id;
	
-- 查询有奖金的员工名,部门名
SELECT
	e.last_name,
	e.commission_pct,
	d.department_name
FROM
	employees AS e,
	departments AS d
WHERE
	d.department_id = e.department_id
		AND e.commission_pct IS NOT NULL;
		
-- 查询城市名中第二个字符为 o 的,对应的部门名和城市名
/*
添加筛选条件
*/
SELECT
	d.department_name,
	l.city
FROM
	departments AS d,
	locations AS l
WHERE
	d.location_id = l.location_id
		AND l.city LIKE '_o%';
		
-- 查询每个城市的部门个数
/*
可以添加分组
同时肯定可以 HAVING
*/
SELECT
	COUNT(*) AS 个数,
		l.city
FROM
	locations AS l,
	departments AS d
WHERE
	l.location_id = d.location_id
GROUP BY
	l.city;
	
-- 查询出有奖金的,每个部门的,部门名和部门的领导编号,以及该部门的最低工资
SELECT
		MIN(e.salary) AS 最低工资,
	d.manager_id AS 领导编号,
	d.department_name AS 部门名称,
	d.department_id AS 部门编号
FROM
	employees AS e,
	departments AS d
WHERE
	e.department_id = d.department_id
		AND e.commission_pct IS NOT NULL
GROUP BY
	e.department_id;
	
-- 查询每个工种的,工种名和员工个数,并且按照员工个数降序
/*
可以使用排序
*/
SELECT
		j.job_title AS 工种名,
	COUNT(*) AS 员工个数
FROM
	employees AS e,
	jobs AS j
WHERE
	j.job_id = e.job_id
GROUP BY
	j.job_title
ORDER BY
	COUNT(*) DESC;
	
-- 查询员工名,部门名,和所在的城市
/*
可以进行多表连接
同时也可以继续进行排序分组
*/
SELECT
	e.last_name AS 员工名,
	d.department_name AS 部门名,
	l.city AS 城市名
FROM
	employees AS e,
	departments AS d,
	locations AS l
WHERE
	e.department_id = d.department_id AND d.location_id = l.location_id;
	
	
	
-- 非等值连接
-- 查询员工的工资,和工资级别
/*
非等值连接的连接条件不再是等于,而是其他逻辑运算符
*/
SELECT
	e.last_name AS 员工姓名,
	e.salary AS 员工工资,
	g.grade_level AS 工资级别
FROM
	employees AS e,
	job_grades AS g
WHERE
	e.salary BETWEEN g.lowest_sal AND g.highest_sal
ORDER BY
	e.salary DESC,e.last_name ASC;
	
	
	
-- 自连接
-- 查询员工名,员工领导的名称
SELECT
	e.employee_id AS 员工编号,
	e.last_name AS 员工名称,
	m.employee_id AS 领导员工编号,
	m.last_name AS 领导名称
FROM
	employees AS e,
	employees AS m
WHERE
	e.manager_id = m.employee_id
ORDER BY
	m.employee_id ASC,e.employee_id ASC;
	

