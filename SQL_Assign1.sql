 # SQL ASSIGN
 
 create database employee_db;
use employee_db;

create table employee_tb (
    employeeID int primary key,
    first_name varchar(50),
    last_name varchar(50),
    salary decimal(10,2),
    joining_Date date,
    department varchar(50),
    gender varchar(10),
    job_title varchar(50)
);
show tables;

insert into employee_tb values
(1, 'Rahul', 'Sharma', 55000.00, '2021-03-15', 'IT', 'Male', 'Software Engineer'),
(2, 'Ananya', 'Reddy', 48000.00, '2020-07-20', 'HR', 'Female', 'HR Executive'),
(3, 'Arjun', 'Verma', 62000.00, '2019-11-10', 'Finance', 'Male', 'Accountant'),
(4, 'Meera', 'Patel', 72000.00, '2022-01-25', 'IT', 'Female', 'Senior Developer'),
(5, 'Rohit', 'Mehra', 40000.00, '2022-05-22', 'Sales', 'Male', 'Sales Executive'),
(6, 'Neha', 'Singh', 65000.00, '2019-04-10', 'Marketing', 'Female', 'Marketing Manager');

select * from tbl_emp_detail_data;
create table employeee as select * from tbl_employee_detail_data;

select * from employee;

select * from employee
order by emp_id asc limit 1;

select * from employee 
order by emp_id desc limit 1;

select * from employee
order by rand() limit 1;

select upper(first_name) as first_name_upper from employee;
select lower(first_name) as first_name_lower from employee;
select concat(" ",first_name,last_name) as full_name from employee;
select concat("Hello",first_name) 
from employee;

select * from employee
where first_name = "Malli";

select * from employee
where first_name in ('Malli','Meena','Anjali');

select * from employee
where first_name not in ('malli','meena','anjali');

select * from employee
where first_name like "v%";

select * from employee
where first_name like "%i";

select * from employee
where first_name like "%o%";

select * from employee
where substring(first_name,1,1) between 'm' and 'v';

select * from employee
where substring(first_name,1,1) not between 'm' and 'v';

select * from employee
where first_name like "m____";

select distinct department as dist_depart
from employee;

select count(*) as total_record
from employee;

select concat(upper(substring(first_name,1,1)), lower(substring(first_name,2))) as Emp_name
from employee;

select group_concat(first_name,", ") as emp_names
from employee;

select  min(salary) as min_salary,
max(salary) as max_salary,
avg(salary) as avg_salary,
(max(salary) - min(salary)) as diff_salary
from employee;

select round(((max(salary) - min(salary)) / max(salary)) * 100, 2) as percent_diff
from employee;
    
select rtrim(first_name)
from employee;
select ltrim(first_name) 
from employee;
select trim(first_name) 
from employee;

select count(*) as total_records
from employee
where salary = 50000;

select * from employee e
where joining_date = (
    select max(joining_date)
    from employee
    where department = department
);


select first_name,
case 
when gender = 'Male' then 'M'
when gender = 'Female' then 'F'
end as gender_short
from employee;

select first_name, salary,
case 
when salary < 50000 then 'Low'
when salary between 50000 and 60000 then 'Medium'
when salary > 60000 then 'High'
end as salary_category
from employee;

select first_name, department,
case 
when department = 'IT' then 'Technical'
when department = 'HR' then 'Human Resources'
when department = 'Finance' then 'Accounting'
else 'Other'
end as department_classification
from employee;

select first_name, salary,
case 
when salary < 50000 then 'Eligible for Raise'
else 'Not Eligible'
end as raise_status
from employee;

select first_name, joining_date,
case 
when joining_date < '2022-01-01' then 'Experienced'
else 'New Hire'
end as employment_status
from employee;

select first_name, salary,
case 
when salary > 60000 then salary * 0.10
when salary between 50000 and 60000 then salary * 0.07
else salary * 0.05
end as bonus_amount
from employee;

select first_name, salary,
case 
when salary > 60000 then 'Senior'
when salary between 50000 and 60000 then 'Mid-Level'
else 'Junior'
end as seniority_level
from employee;

select first_name, department,
case 
when department = 'IT' and salary > 55000 then 'Senior IT Employee'
else 'Other'
end as job_level
from employee;

select first_name, joining_date,
case 
when joining_date > '2024-01-01' then 'Recent Joiner'
else 'Long-Term Employee'
end as recent_joiner_status
from employee;

select first_name, joining_date,
case 
when joining_date < '2021-01-01' then '10 Days Leave'
when joining_date between '2021-01-01' and '2023-01-01' then '20 Days Leave'
else '25 Days Leave'
end as leave_entitlement
from employee;

select first_name, salary, department,
case 
when salary > 60000 and department = 'IT' then 'Promotion Eligible'
else 'Not Eligible'
end as promotion_eligibility
from employee;

select first_name, salary,
case 
when salary < 50000 then 'Eligible for Overtime Pay'
else 'Not Eligible'
end as overtime_eligibility
from employee;

select first_name, department, salary,
case 
when department = 'HR' and salary > 60000 then 'HR Executive'
when department = 'Finance' and salary > 55000 then 'Finance Manager'
else 'Regular Employee'
end as job_title
from employee;

select first_name, salary,
case 
when salary > (select avg(salary) from employee) then 'Above Average'
else 'Below Average'
end as salary_comparison
from employee;


select department, sum(salary) as total_salary
from employee
group by department
order by total_salary asc;

select department, sum(salary) as total_salary
from employee
group by department
order by total_salary desc;


select * from tbl_project_details;
create table project as select * from tbl_project_details;

select project_name
from project
group by project_name
having count(employee_id) > 1;

select department,
count(department) as total_departments,
sum(salary) as total_salary
from employee
group by department;

select department, salary
from employee
order by department, salary;

select department, avg(salary) as avg_salary
from employee
group by department
order by avg_salary asc;

select department, max(salary) as max_salary
from employee
group by department
order by max_salary asc;

select department,
count(*) as employee_count,
case 
when count(*) > 5 then 'Large'
when count(*) between 3 and 5 then 'Medium'
else 'Small'
end as dept_size from employee
group by department;

select department, avg(salary) as avg_salary,
case 
when avg(salary) > 60000 then 'High Pay'
when avg(salary) between 50000 and 60000 then 'Medium Pay'
else 'Low Pay'
end as pay_level
from employee
group by department;

select * from employee;

select department, gender,
count(*) as total_employees
from employee
group by department, gender;

select year(joining_date) as join_year, count(*) as total_hires,
case
when count(*) > 5 then 'High Hiring'
when count(*) between 3 and 5 then 'Moderate Hiring'
else 'Low Hiring'
end as hiring_trend
from employee
group by year(joining_date);


select department,max(salary) as highest_salary,
case
when max(salary) > 70000 then 'Senior Leadership'
else 'Mid-Level'
end as role_level
from employee
group by department;

select department,count(case when salary > 60000 then 1 end) as high_earners,
case
when count(case when salary > 60000 then 1 end) > 2 
then 'High-Paying Team'
else 'Regular Team'
end as dept_category
from employee
group by department;

select joining_date, year(joining_date) as join_year,
month(joining_date) as join_month,
day(joining_date) as join_day,curdate() as current_date
from employee;

select joining_date,
timestampdiff(month, joining_date, curdate()) as diff_in_months,
datediff(curdate(), joining_date) as diff_in_days
from employee;

select * from employee
where year(joining_date) = 2020;

select *from employee
where month(joining_date) = 2;

select *
from employee
where joining_date between '2021-01-01' and '2021-12-01';