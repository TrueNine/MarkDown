-- 单行函数测试



-- 1. 显示系统时间(注：日期+时间) 
SELECT NOW()

-- 2. 查询员工号，姓名，工资，以及工资提高百分之 20%后的结果（new salary)
	SELECT
		employee_id AS 员工编号,
		CONCAT(last_name,first_name) AS 员工姓名,
		salary AS 员工工资,
		salary * 1.2 AS "%20工资"
	FROM
		employees;
		
-- 3. 将员工的姓名按首字母排序，并写出姓名的长度（length） 
SELECT
	CONCAT(last_name,first_name) AS 姓名,
	LENGTH(last_name) AS 姓长度
FROM
	employees
ORDER BY
	SUBSTRING(last_name,1,1) ASC,
	LENGTH(last_name) ASC;
	
-- 4. 做一个查询，产生下面的结果 <last_name> earns <salary> monthly but wants <salary*3>
SELECT
	CONCAT(
		last_name,
		' earns ',
		salary,
		' monthly but wants ',
		(salary * 3)
	)
FROM
	employees;
	
-- 5. 使用 case-when，按照下面的条件： job 
/*
job                  grade 
AD_PRES                A 
ST_MAN                 B 
IT_PROG                C 
SA_REP                 D 
ST_CLERK               E 

产生下面的结果 

last_name   job_id   grade
*/
SELECT
	last_name,
	job_id,
	CASE JOB_id
		WHEN 'AD_PRES'
			THEN 'A'
		WHEN 'ST_MAN'
			THEN 'B'
		WHEN 'IT_PROG'
			THEN 'C'
		WHEN 'SA_REP'
			THEN 'D'
		WHEN 'ST_CLERK'
			THEN 'E'
		ELSE 'NONE'
	END AS grade
FROM
	employees
ORDER BY
	grade ASC,SUBSTRING(last_name,1,1) ASC;