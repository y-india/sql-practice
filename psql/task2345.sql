
select * from employee


task 2 -> we want output in this format -> 1:Raj:Sharama:IT




SELECT CONCAT_WS(':' , emp_id , fname , lname , dept) as 
Task2_ans , * FROM employee ;




task 3 -> format -> 1:Raju Shrama:IT:50000




SELECT 
	CASE 
		WHEN fname <> lname 
			THEN CONCAT( fname , ' ' , lname )
		ELSE fname
  END AS full_name 
FROM employee;




CREATE VIEW employee_with_fullname AS
SELECT
  emp_id,
  CASE
    WHEN fname <> lname THEN CONCAT(fname, ' ', lname)
    ELSE fname
  END AS full_name
FROM employee;


select * from employee_with_fullname ;




SELECT
  v.full_name,
  CONCAT_WS(':', e.emp_id, v.full_name, e.dept, e.salary) AS Task3_ans
FROM employee e
JOIN employee_with_fullname v
  ON v.emp_id = e.emp_id;
















task 4 -> format -> 4:Suman:FINANCE





SELECT CONCAT_WS(':' , emp_id , fname , UPPER(dept) ) FROM employee 
AS Task4_ANS ;










task 5 -> format -> I1 Raju or H2 Priya



select SUBSTR(dept , 1, 1) from employee ;






SELECT CONCAT( SUBSTR(dept , 1, 1) , emp_id , ' ' , fname)
AS Task5_ANS FROM employee ;



