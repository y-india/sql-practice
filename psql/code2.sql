CREATE TABLE policyholders (
    policyholder_id INTEGER PRIMARY KEY,
    age INTEGER NOT NULL,
    gender VARCHAR(10) NOT NULL,
    state VARCHAR(50) NOT NULL,
    occupation VARCHAR(50),
    marital_status VARCHAR(20),
    smoking_status VARCHAR(20),
    annual_income NUMERIC(12,2),
    policy_type VARCHAR(30),
    policy_start_date DATE
);







INSERT INTO policyholders (
    policyholder_id,
    age,
    gender,
    state,
    occupation,
    marital_status,
    smoking_status,
    annual_income,
    policy_type,
    policy_start_date
) VALUES
(4001, 24, 'Male', 'Texas', 'Engineer', 'Single', 'Non Smoker', 58000, 'Term Life', '2022-01-10'),
(4002, 31, 'Female', 'California', 'Teacher', 'Single', 'Non Smoker', 68000, 'Health', '2021-05-18'),
(4003, 45, 'Male', 'Florida', 'Driver', 'Married', 'Smoker', 47000, 'Auto', '2019-09-12'),
(4004, 52, 'Female', 'New York', 'Accountant', 'Married', 'Non Smoker', 99000, 'Whole Life', '2016-03-25'),
(4005, 28, 'Male', 'Illinois', 'Construction', 'Single', 'Smoker', 52000, 'Disability', '2023-02-01'),
(4006, 36, 'Female', 'Texas', 'Engineer', 'Married', 'Non Smoker', 88000, 'Term Life', '2020-07-14'),
(4007, 41, 'Male', 'California', 'Manager', 'Married', 'Non Smoker', 105000, 'Whole Life', '2018-11-09'),
(4008, 33, 'Female', 'Florida', 'Nurse', 'Single', 'Non Smoker', 74000, 'Health', '2022-06-30'),
(4009, 57, 'Male', 'New York', 'Consultant', 'Married', 'Smoker', 112000, 'Term Life', '2015-04-17'),
(4010, 26, 'Female', 'Illinois', 'Analyst', 'Single', 'Non Smoker', 61000, 'Auto', '2023-08-21'),
(4011, 48, 'Male', 'Texas', 'Sales', 'Married', 'Smoker', 69000, 'Disability', '2019-01-06'),
(4012, 39, 'Female', 'California', 'Designer', 'Married', 'Non Smoker', 82000, 'Health', '2020-10-12'),
(4013, 34, 'Male', 'Florida', 'Electrician', 'Single', 'Smoker', 56000, 'Auto', '2021-03-03'),
(4014, 59, 'Female', 'New York', 'HR', 'Married', 'Non Smoker', 97000, 'Whole Life', '2014-07-22'),
(4015, 27, 'Male', 'Illinois', 'Student', 'Single', 'Non Smoker', 32000, 'Health', '2023-01-15'),
(4016, 44, 'Female', 'Texas', 'Lawyer', 'Married', 'Non Smoker', 125000, 'Term Life', '2018-05-05'),
(4017, 51, 'Male', 'California', 'Business Owner', 'Married', 'Smoker', 140000, 'Whole Life', '2016-09-18'),
(4018, 35, 'Female', 'Florida', 'Marketing', 'Single', 'Non Smoker', 77000, 'Disability', '2020-12-01'),
(4019, 29, 'Male', 'New York', 'Photographer', 'Single', 'Non Smoker', 54000, 'Auto', '2022-04-09'),
(4020, 62, 'Female', 'Illinois', 'Retired', 'Married', 'Non Smoker', 45000, 'Health', '2013-06-27'),
(4021, 38, 'Male', 'Texas', 'Project Manager', 'Married', 'Non Smoker', 91000, 'Term Life', '2019-10-10'),
(4022, 46, 'Female', 'California', 'HR Manager', 'Married', 'Non Smoker', 102000, 'Health', '2017-08-19'),
(4023, 23, 'Male', 'Florida', 'Intern', 'Single', 'Non Smoker', 28000, 'Auto', '2023-05-02'),
(4024, 55, 'Female', 'New York', 'Professor', 'Married', 'Non Smoker', 118000, 'Whole Life', '2015-02-14'),
(4025, 32, 'Male', 'Illinois', 'Data Analyst', 'Single', 'Non Smoker', 76000, 'Term Life', '2021-11-11'),
(4026, 49, 'Female', 'Texas', 'Operations', 'Married', 'Smoker', 87000, 'Disability', '2018-03-07'),
(4027, 37, 'Male', 'California', 'Product Manager', 'Married', 'Non Smoker', 115000, 'Health', '2020-06-16'),
(4028, 42, 'Female', 'Florida', 'Real Estate', 'Married', 'Smoker', 94000, 'Term Life', '2019-09-29'),
(4029, 30, 'Male', 'New York', 'Journalist', 'Single', 'Non Smoker', 67000, 'Auto', '2022-12-04'),
(4030, 58, 'Female', 'Illinois', 'Administrator', 'Married', 'Non Smoker', 89000, 'Whole Life', '2014-01-20');








select * from policyholders ;





SELECT AVG(annual_income) from policyholders ;







SELECT policy_type from policyholders GROUP BY policy_type ;





SELECT AVG(LENGTH(state)) from policyholders ;





select * from policyholders ;







select * from employee ;







ALTER TABLE employee 
ADD column added INT ;




ALTER table employee 
ALTER column salary 
SET DATA TYPE FLOAT;











SELECT pg_typeof(salary)
FROM employee
LIMIT 1;





select * from policyholders ;



select min(age) as minimum , max(age) as maximam from policyholders ;














-- case expression 
select policyholder_id , gender , annual_income , CASE
	WHEN age >= 45 then '45 parr'
	WHEN age >= 35 then '35 parr'
	WHEN age >= 18 then 'Mature'
	ELSE 'pata ni'
END as age_category 
FROM policyholders;
























