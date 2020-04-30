USE girls;

-- 一、查询编号>3的女神的男朋友信息，如果有则列出详细，如果没有，用null填充
SELECT
	b.id,
	bo.*
FROM
	beauty AS b
		LEFT OUTER JOIN boys AS bo
			ON b.boyfriend_id = bo.id
WHERE
	b.id > 3;
	
-- 二、查询哪个城市没有部门
USE myemployees;
SELECT
	l.city,
	d.department_name
FROM
	locations AS l
		LEFT OUTER JOIN departments AS d
			ON l.location_id = d.location_id
WHERE
	d.department_id IS NULL;
	
-- 三、查询部门名为SAL或IT的员工信息
SELECT
	d.department_id,
	d.department_name,
	e.*
FROm
	departments AS d
		LEFT OUTER JOIN employees AS e
			ON d.department_id = e.department_id
WHERE
	d.department_name IN('SAL','IT');