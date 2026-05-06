
CREATE TABLE person (
	id INT ,
	first_name VARCHAR(20) ,
	last_name VARCHAR(20) ,
	city VARCHAR(50)
) ;


INSERT INTO person (id , first_name , last_name , city)
VALUES (100,'Raju','Rana','Ambala') ;





SELECT * FROM person ;



INSERT INTO person VALUES  (102 , 'Dholu' , 'Sharma' , 'Dholakpur') , (103 , 'Bholu' , 'Sharma' , 'Dholakpur') ;











SELECT * FROM person ;

UPDATE person 
	SET city = 'Panji' 
WHERE id = 101 
;











-- First Task -> Create a employee table for DesiDaru Company 

-- coulmns are -> emp_id , fname , lname , email , dept. ,salary , hire_date .
-- stuff inculded -> total number of employers are 20 , 
-- email is specially designed as name@DesiDaru.com ,
-- email can be null ,
-- name and surname can be same ,
-- dept. are three -> IT , Marketing and Finance ,
-- salary range is 30K to 1lakh <- default salary is 30k ,
-- comapny started on 2017 -01 -01 .





