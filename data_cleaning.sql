CREATE DATABASE Projects;
use Projects;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(25) ;

SET sql_safe_updates = 0;

UPDATE hr 
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL 
END ;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr 
SET hire_date = CASE
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL 
END ;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = date_format(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'), '%Y-%m-%d' )
WHERE termdate IS NOT NULL ;

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPdiff(YEAR,birthdate,CURDATE());