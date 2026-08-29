-- TO CREATE DATABASE
create database student_course_db;

-- USING DATABASES (start work in database)
use student_course_db;

-- TO CREATE TABLE IN DATABASE
create table students(
student_id int primary key,
full_name varchar(50) not null,
email varchar(100) unique not null,
phone_number bigint unique,
course_name varchar(30),
date_of_birth date,
registration_date datetime
);

-- VIEW TABLE
show tables;

-- INSERTING DATA
insert into students(student_id, full_name,email,phone_number,course_name,date_of_birth,registration_date) values
(1001, "Kalash Priya", "kp16@gmail.com", 9363524485, "BTech CSE", '2005-10-09', '2025-08-19 21:01:00'),
(1002, "Rohan Mehta", "rohan.mehta@gmail.com", 8363524486, "BTech IT", '2004-07-15', '2025-05-20 10:15:00'),
(1003, "Sneha Sharma", "sneha.sharma@yahoo.com", 7363524487, "MBA Finance", '2006-03-22', '2025-12-10 14:30:00'),
(1004, "Amit Kumar", "amit.kumar@gmail.com", 6363524488, "MTech AI", '2005-11-05', '2025-01-15 09:45:00'),
(1005, "Priya Singh", "priya.singh@gmail.com", 5363524489, "BTech ECE", '2004-06-18', '2025-09-30 16:20:00'),
(1006, "Vikas Gupta", "vikas.gupta@gmail.com", 4363524490, "BBA Marketing", '2006-12-25', '2025-07-12 11:10:00'),
(1007, "Neha Verma", "neha.verma@gmail.com", 3363524491, "BTech CSE", '2005-01-14', '2025-03-05 13:55:00'),
(1008, "Arjun Patel", "arjun.patel@gmail.com", 2363524492, "MCA", '2004-09-09', '2025-11-22 17:40:00'),
(1009, "Kiran Das", "kiran.das@gmail.com", 1363524493, "BTech Mechanical", '2006-02-28', '2025-06-18 08:25:00'),
(1010, "Meera Nair", "meera.nair@gmail.com", 9363524494, "MBA HR", '2005-08-12', '2025-04-25 19:05:00'),
(1011, "Sahil Khan", "sahil.khan@gmail.com", 8363524495, "BTech Civil", '2004-05-30', '2025-08-10 12:50:00'),
(1012, "Ananya Roy", "ananya.roy@gmail.com", 7363524496, "BTech IT", '2006-12-01', '2025-02-14 15:15:00'),
(1013, "Ravi Yadav", "ravi.yadav@gmail.com", 6363524497, "MTech Robotics", '2005-04-19', '2025-11-09 09:00:00'),
(1014, "Divya Kapoor", "divya.kapoor@gmail.com", 5363524498, "BTech CSE", '2004-07-07', '2025-10-28 18:45:00'),
(1015, "Manish Rathi", "manish.rathi@gmail.com", 4363524499, "MBA Operations", '2006-10-02', '2025-01-30 07:35:00'),
(1016, "Shreya Iyer", "shreya.iyer@gmail.com", 3363524400, "BTech EEE", '2005-11-11', '2025-03-21 20:25:00'),
(1017, "Rahul Sen", "rahul.sen@gmail.com", 2363524401, "MCA", '2004-06-06', '2025-09-15 10:10:00'),
(1018, "Pooja Mishra", "pooja.mishra@gmail.com", 1363524402, "BTech IT", '2006-01-20', '2025-12-05 14:55:00'),
(1019, "Aditya Rao", "aditya.rao@gmail.com", 9363524403, "BTech CSE", '2004-03-03', '2025-05-17 11:40:00'),
(1020, "Nisha Jain", "nisha.jain@gmail.com", 8363524404, "MBA Finance", '2005-09-27', '2025-06-08 16:30:00');

-- SHOW TABLE WITH DATA
select * from students;

-- SHOW SELECTED COLUMNS ONLY
select student_id, full_name, course_name from students;

-- SHOW NAMES IN DESCENDING ORDER
select * from students
order by full_name desc;

-- REGISTRATION DATES IN AESCENDING ORDER
select * from students
order by registration_date;

-- CANDIDATES WHO REGISTERED FOR COURSES OTHER THAN "BTECH CSE"
select * from students
where not course_name = "BTech CSE"
order by student_id;
