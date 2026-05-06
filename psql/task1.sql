-- First Task -> Create a employee table for DesiDaru Company 

-- coulmns are -> emp_id , fname , lname , email , dept. ,salary , hire_date .
-- stuff inculded -> total number of employers are 20 , 
-- email is specially designed as name@DesiDaru.com ,
-- email can be null ,
-- name and surname can be same ,
-- dept. are three -> IT , Marketing and Finance ,
-- salary range is 30K to 1lakh <- default salary is 30k ,
-- comapny started on 2017 -01 -01 .




CREATE TABLE employee (
	emp_id SERIAL PRIMARY KEY ,
	fname VARCHAR(20), 
	lname VARCHAR(20), 
	email TEXT UNIQUE, 
	dept TEXT NOT NULL
CHECK (dept IN ('IT', 'Finance', 'Marketing'))
,
	salary NUMERIC(10,2) NOT NULL
CHECK (salary BETWEEN 30000 AND 100000)
, 
	hire_date DATE NOT NULL
CHECK (hire_date >= DATE '2017-01-01')	
)












INSERT INTO employee
(fname, lname, email, dept, salary, hire_date)
VALUES
('Amit', 'Shah', 'amit@DesiDaru.com', 'IT', 45000, '2017-02-10')








INSERT INTO employee
(fname, lname, email, dept, salary, hire_date)
VALUES
('Rohit', 'Rohit', NULL, 'Marketing', 30000, '2017-03-15'),
('Vikas', 'Verma', 'vikas@DesiDaru.com', 'Finance', 60000, '2017-06-01'),
('Arjun', 'Singh', 'arjun@DesiDaru.com', 'IT', 75000, '2018-01-20'),
('Karan', 'Mehta', NULL, 'Marketing', 30000, '2018-04-05'),
('Suresh', 'Gupta', 'suresh@DesiDaru.com', 'Finance', 82000, '2018-09-12'),
('Manoj', 'Manoj', NULL, 'IT', 30000, '2019-02-18'),
('Rahul', 'Patel', 'rahul@DesiDaru.com', 'Marketing', 50000, '2019-07-01'),
('Deepak', 'Malhotra', NULL, 'Finance', 95000, '2019-11-21'),
('Nitin', 'Iyer', 'nitin@DesiDaru.com', 'IT', 30000, '2020-01-10'),
('Ramesh', 'Rao', NULL, 'Marketing', 42000, '2020-05-30'),
('Anil', 'Anil', 'anil@DesiDaru.com', 'Finance', 30000, '2020-10-14'),
('Sanjay', 'Kapoor', NULL, 'IT', 68000, '2021-03-08'),
('Prakash', 'Bansal', 'prakash@DesiDaru.com', 'Marketing', 30000, '2021-06-19'),
('Mahesh', 'Yadav', NULL, 'Finance', 72000, '2021-12-01'),
('Ravi', 'Ravi', 'ravi@DesiDaru.com', 'IT', 30000, '2022-02-17'),
('Ajay', 'Chauhan', NULL, 'Marketing', 56000, '2022-07-25'),
('Sunil', 'Agarwal', 'sunil@DesiDaru.com', 'Finance', 88000, '2023-01-09'),
('Akash', 'Joshi', NULL, 'IT', 30000, '2023-05-11'),
('Vinod', 'Nair', 'vinod@DesiDaru.com', 'Marketing', 64000, '2024-01-16');









ALTER TABLE employee
ALTER COLUMN email DROP NOT NULL;






select * from employee







