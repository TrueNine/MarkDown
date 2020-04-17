-- 分组查询测试
USE myemployees;

-- 1. 查询各 job_id 的员工工资的最大值，最小值，平均值，总和，并按 job_id 升序 
SELECT
		job_id AS 职位,
	MAX(salary) AS 最大工资,
	MIN(salary) AS 最小工资,
	SUM(salary) AS 工资总和,
	AVG(salary) AS 平均工资
FROM
	employees
GROUP BY
	job_id
ORDER BY
	job_id ASC;
	
-- 2. 查询员工最高工资和最低工资的差距（DIFFERENCE）
SELECT
	MAX(salary) AS 最高工资,
	MIN(salary) AS 最低工资,
		MAX(salary) - MIN(salary)AS 工资差距
FROM
	employees;
	
-- 3. 查询各个管理者手下员工的最低工资，其中最低工资不能低于 6000，没有管理者的员 工不计算在内
/*
错误,应将工资的筛选条件加在 HAVING
*/
SELECT
	MIN(salary) AS 最小工资,
		manager_id AS 管理ID
FROM
	employees
WHERE
	manager_id IS NOT NULL
GROUP BY
	manager_id
HAVING
	MIN(salary) > 6000
ORDER BY
	MIN(salary) ASC,manager_id ASC;

-- 4. 查询所有部门的编号，员工数量和工资平均值,并按平均工资降序 
SELECT
	TRUNCATE(AVG(salary),3) AS 工资平均,
	COUNT(*) AS 员工数量,
		department_id AS 部门编号
FROM
	employees
WHERE
	department_id IS NOT NULL
GROUP BY
	department_id
ORDER BY
	AVG(salary) DESC,COUNT(*) DESC;
		
-- 5. 选择具有各个 job_id 的员工人数 
SELECT
	COUNT(*) AS 员工人数,
		job_id AS 职位
FROM
	employees
GROUP BY
	job_id;