
select * from employee ;



ALTER TABLE employee
ADD COLUMN full_name VARCHAR(55);




ALTER TABLE employee
Drop COLUMN added ;





UPDATE employee
SET full_name =
    CASE
        WHEN fname <> lname THEN fname || ' ' || lname
        ELSE fname
    END;








SELECT 
	CASE 
		WHEN fname <> lname 
			THEN CONCAT( fname , ' ' , lname )
		ELSE fname
  END AS full_name 
FROM employee;












select max(salary) , min(salary) from employee ;




select dept , SUM(salary) from employee 
	group by dept
	having sum(salary) > 350000 ;





select * from employee ;

insert into employee(fname , lname , email , dept , salary)
values ('Desi' , 'Daru' , 'daru@desi.com' , 'IT' , 30000 ) ;


ALTER TABLE employee
ALTER COLUMN hire_date
SET DEFAULT CURRENT_DATE;










CREATE OR REPLACE PROCEDURE add_emp(
    p_fname  TEXT,
    p_lname  TEXT,
    p_email  TEXT,
    p_dept   TEXT,
    p_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employee (fname, lname, email, dept, salary)
    VALUES (p_fname, p_lname, p_email, p_dept, p_salary);
END;
$$;





CALL add_emp(
    'Rahul',
    'Daru',
    'rahulbhai@desi.com',
    'IT',
    30000
);


DROP FUNCTION dept_max_salary_emp(character varying) ;

CREATE OR REPLACE FUNCTION dept_max_salary_emp(p_dept VARCHAR(50))
RETURNS TABLE (
    emp_id INT,
    fname VARCHAR(50),
    salary DOUBLE PRECISION
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        e.emp_id,
        e.fname,
        e.salary
    FROM employee e
    WHERE e.dept = p_dept
      AND e.salary = (
          SELECT MAX(emp.salary)
          FROM employee emp
          WHERE emp.dept = p_dept
      );
END;
$$;



SELECT * 
FROM dept_max_salary_emp('IT');


























UPDATE employee
SET full_name =
    CASE
        WHEN fname <> lname THEN fname || ' ' || lname
        ELSE fname
    END;


