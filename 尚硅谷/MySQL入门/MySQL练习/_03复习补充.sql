/*
1. 可以排序单个,也可以排序多个
2. order by 语句,放置于语句的最后,limit 子句除外
3. 
*/

-- 测试排序查询
USE myemployees;
-- 查询员工信息,要求工资从高到低(使用降序)
SELECT
	*
FROM
	employees
ORDER BY salary	 DESC;

-- 同上相反
SELECT
	*
FROM
	employees
ORDER BY salary ASC;

-- 查询部门编号 大于等于 90 的员工信息,按入职时间先后进行排序
/*
1. 可以添加筛选条件
2. 可以对时间进行排序
*/
SELECT
	*
FROM
	employees
WHERE
	department_id >= 90;	
ORDER BY hiredata ASC;

-- 查询员工信息,按年薪高低显示员工信息
/*
可以按照表达式进行排序
*/
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	salary * 12 * (1 + IFNULL(commission_pct,0)) AS 年薪
FROM
	employees
ORDER BY
	salary * 12 * (1 + IFNULL(commission_pct,0)) DESC;
	
-- 同上题目,按照别名进行排序
/*
可以实现使用年薪进行排序
*/
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	salary * 12 * (1 + IFNULL(commission_pct,0)) AS 年薪
FROM
	employees
ORDER BY
	年薪 DESC;
	
-- 按照姓名的长度进行排序(按照函数排序)
/*
按照函数进行排序,使用 LENGTH() 函数,返回长度
*/
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	employee_id,	
	LENGTH(CONCAT(last_name,first_name)) AS 姓名长度
FROM
	employees
ORDER BY
	LENGTH(CONCAT(last_name,first_name)) DESC;
	
-- 查询员工信息,先按照工资排序,再按照员工编号排序
/*
可以同时按照多种方式进行排序
优先使用最前面的,依次向后
同样可以使用函数,别名,....
*/
SELECT
	salary AS 工资,
	employee_id AS 员工编号
FROM
	employees
ORDER BY
	salary ASC,employee_id DESC;