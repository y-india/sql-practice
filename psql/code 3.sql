

CREATE TABLE contacts (
	name VARCHAR(50) ,
	mobile VARCHAR(15) UNIQUE CHECK (LENGTH(mobile) = 10)
) ;






select * from contacts ;


INSERT INTO contacts(name , mobile)
VALUEs ('Tapu Singh' , 98543210) ;








INSERT INTO contacts(name , mobile)
VALUEs ('Samlal Dudwala' , 7654321089) ;    -- failed 





ALTER TABLE contacts
ADD CONSTRAINT name_must_with_surname CHECK 
(name LIKE '% %');





DELETE FROM contacts 
where name = 'Ram'
;












INSERT INTO contacts(name, mobile) VALUES
('Rahul Mehra', '9123456780'),
('Anita Sharma', '9234567891'),
('Vikram Singh', '9345678902'),
('Priya Desai', '9456789013'),
('Ramesh Kumar', '9567890124'),
('Sneha Kapoor', '9678901235'),
('Arjun Patel', '9789012346'),
('Neha Reddy', '9890123457'),
('Deepak Joshi', '9901234568'),
('Kiran Nair', '9012345679'),
('Manish Gupta', '9123456701'),
('Sunita Verma', '9234567812'),
('Amit Bansal', '9345678923'),
('Pooja Malhotra', '9456789034'),
('Rohit Chauhan', '9567890145'),
('Meera Iyer', '9678901256'),
('Siddharth Jain', '9789012367'),
('Tanya Rathi', '9890123478'),
('Aditya Khanna', '9901234589'),
('Neelam Saxena', '9012345690'),
('Harsh Vohra', '9123456711'),
('Ritu Aggarwal', '9234567822'),
('Karan Mehta', '9345678933'),
('Alka Trivedi', '9456789044'),
('Vikas Rao', '9567890155'),
('Shreya Ghosh', '9678901266'),
('Ankur Dey', '9789012377'),
('Maya Pillai', '9890123488'),
('Pranav Rangan', '9901234599'),
('Divya Choudhury', '9012345600');



select * from contacts ;





ALTER TABLE contacts
ADD COLUMN id SERIAL PRIMARY KEY;








-- use of foreign key
CREATE TABLE family_of_contacts (
    family_id SERIAL PRIMARY KEY,
    id INT REFERENCES contacts(id),
    wife_name VARCHAR(50) DEFAULT 'Single (No wife)',
    no_of_children INT DEFAULT 0,
    karja NUMERIC(12,2)
);







select * from family_of_contacts ;







INSERT INTO family_of_contacts (id, wife_name, no_of_children, karja) VALUES
(5, 'Ritu Singh', 3, 200000),
(1, 'Single (No wife)', 0, 0),
(22, 'Single (No wife)', 0, 0),
(14, 'Single (No wife)', 0, 0),
(29, 'Maya Dey', 1, 70000),
(3, 'Anjali Mehra', 2, 150000),
(10, 'Single (No wife)', 0, 0),
(17, 'Meera Chauhan', 3, 250000),
(8, 'Single (No wife)', 0, 0),
(12, 'Single (No wife)', 0, 0),
(25, 'Alka Mehta', 3, 220000),
(2, 'Single (No wife)', 0, 0),
(31, 'Divya Rangan', 2, 150000),
(7, 'Sunita Kumar', 2, 120000),
(20, 'Single (No wife)', 0, 0),
(16, 'Single (No wife)', 0, 0),
(27, 'Shreya Rao', 2, 170000),
(24, 'Single (No wife)', 0, 0),
(4, 'Rahul Sharma', 1, 50000),
(19, 'Tanya Jain', 1, 60000),
(6, 'Single (No wife)', 0, 0),
(28, 'Single (No wife)', 0, 0),
(18, 'Single (No wife)', 0, 0),
(21, 'Neelam Khanna', 2, 140000),
(11, 'Priya Joshi', 2, 180000),
(23, 'Ritu Vohra', 1, 80000),
(13, 'Anita Gupta', 1, 90000),
(9, 'Neha Patel', 1, 75000),
(15, 'Pooja Bansal', 2, 160000),
(26, 'Single (No wife)', 0, 0),
(30, 'Single (No wife)', 0, 0),
(32, 'Single (No wife)', 0, 0),
(1, 'Single (No wife)', 0, 0);









select * from family_of_contacts ;


