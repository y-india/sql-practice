

with avg_sal as (
select dept , AVG(salary) as avi_salary from employee group by dept
)
select 
	e.emp_id , e.fname , e.dept , e.salary , a.avg_salary
from employee e 
JOIN 
	avg_sal a on e.dept = a.dept 
where 
e.salary > a.avg_salary ;





WITH avg_sal AS (
    SELECT
        dept,
        AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept
)
SELECT
    e.emp_id,
    e.fname,
    e.dept,
    e.salary,
    a.avg_salary
FROM employee e
JOIN avg_sal a
    ON e.dept = a.dept
WHERE e.salary > a.avg_salary;












select * from employee ;





CREATE OR REPLACE FUNCTION check_salary()
RETURNS trigger AS $$
BEGIN
    IF NEW.salary < 0 THEN
        NEW.salary := 0;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;





CREATE TRIGGER before_update_salary
BEFORE UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION check_salary();




INSERT INTO employee (emp_id, fname, dept, salary)
VALUES (1, 'John', 'IT', -5000);


