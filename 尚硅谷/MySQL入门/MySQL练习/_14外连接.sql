-- 外连接


/*
特点:
	查询主表中的所有记录
		如果从表中有匹配的(连接条件成立),则显示匹配值
			如果从表中没有匹配项,则显示null
	
	主表和从表的区别,
		左(右)外连接: 左(右)主
			如果交换顺序,可以实现同样的效果
		左(右)外连接查询结果 = 内连接结果,主表中有,从表中没有的记录
			
	全外连接
		内连接的结果 + 表1无+表2有 + 表2有表1无的
*/



-- 查询男朋友不在女神表中的女神有哪些
SELECT
	b.`name`,
	bo.boyName
FROm
	beauty AS b
		LEFT OUTER JOIN boys AS bo
			ON b.boyfriend_id = bo.id
WHERE
	bo.id IS NULL;
	
-- 查询哪个部门没有员工
USE myemployees;

-- 左外连接
SELECT
	d.*,
	e.employee_id
FROM
	departments AS d
		LEFT OUTER JOIN employees AS e
			ON 	e.department_id = d.department_id
WHERE
	e.employee_id IS NULL;

-- 右外连接
SELECT
	d.department_id,
	d.department_name,
	e.employee_id
FROM
	employees AS e
		RIGHT OUTER JOIN departments AS d
			ON e.department_id = d.department_id
WHERE
	e.employee_id IS NULL;
	
	
	
-- 全外连接
/*
MySQL 不支持
*/

USE girls;
-- 测试语法
SELECT
	b.*,
	bo.id
FROM
	beauty AS b
		FULL OUTER JOIN boys AS bo
			ON b.boyfriend_id = bo.id
WHERE
	bo.id IS NULL;
	
	
	
-- 交叉连接
/*
使用关键字 CROSS OUTER JOIN

	使用 99 语法实现的 笛卡尔乘积
*/

SELECt
	b.*,
	bo.*
FROM
	beauty AS b
		CROSS OUTER JOIN boys AS bo;
	
	
	
	
	
	
	
	
	
	
	
	
	