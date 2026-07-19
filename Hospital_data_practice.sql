-- ============================================================
--  HOSPITAL DATA — CLEAN QUERY FILE
-- ============================================================

CREATE DATABASE Hospital_data;
USE Hospital_data;

-- ── TABLE: patients ──────────────────────────────────────────
CREATE TABLE patients (
    patient_id  INT PRIMARY KEY,
    name        VARCHAR(50),
    age         INT,
    gender      VARCHAR(20),
    city        VARCHAR(50),
    blood_group VARCHAR(50)
);

INSERT INTO patients (patient_id, name, age, gender, city, blood_group)
VALUES
(1,  'Arjun Kumar',    34, 'Male',   'Chennai',   'O+'),
(2,  'Priya Sharma',   28, 'Female', 'Mumbai',    'A+'),
(3,  'Ramesh Babu',    52, 'Male',   'Chennai',   'B+'),
(4,  'Kavitha Nair',   45, 'Female', 'Bangalore', 'AB+'),
(5,  'Vikram Singh',   31, 'Male',   'Mumbai',    'O-'),
(6,  'Meenakshi Raj',  72, 'Female', 'Chennai',   'A-'),
(7,  'Suresh Menon',   41, 'Male',   'Delhi',     'B+'),
(8,  'Ananya Iyer',    25, 'Female', 'Bangalore', 'O+'),
(9,  'Rajesh Pillai',  60, 'Male',   'Mumbai',    'AB-'),
(10, 'Deepika Nair',   38, 'Female', 'Delhi',     'A+'),
(11, 'Karthik Selvam', 47, 'Male',   'Chennai',   'O+'),
(12, 'Lakshmi Priya',  55, 'Female', 'Bangalore', 'B-'),
(13, 'Mohan Das',      68, 'Male',   'Delhi',     'A+'),
(14, 'Sangeetha Ravi', 33, 'Female', 'Mumbai',    'O+'),
(15, 'Dinesh Kumar',   29, 'Male',   'Chennai',   'AB+');

-- ── TABLE: doctors ───────────────────────────────────────────
CREATE TABLE doctors (
    doctor_id      INT PRIMARY KEY,
    name           VARCHAR(50),
    department     VARCHAR(50),
    experience_yrs INT,
    salary         DECIMAL(10,2)
);

INSERT INTO doctors (doctor_id, name, department, experience_yrs, salary)
VALUES
(1, 'Dr. Anand Rao',       'Cardiology',   18, 120000.00),
(2, 'Dr. Preethi Subbu',   'Cardiology',   10,  95000.00),
(3, 'Dr. Meena Pillai',    'Neurology',    15, 105000.00),
(4, 'Dr. Karthik Iyer',    'Neurology',    12,  98000.00),
(5, 'Dr. Senthil Kumar',   'Orthopaedics', 20, 115000.00),
(6, 'Dr. Revathi Nair',    'Orthopaedics',  8,  82000.00),
(7, 'Dr. Balaji Rajan',    'Paediatrics',  14,  90000.00),
(8, 'Dr. Nithya Krishnan', 'Paediatrics',   6,  75000.00);

-- ── TABLE: departments ───────────────────────────────────────
CREATE TABLE departments (
    dept_id        INT PRIMARY KEY,
    dept_name      VARCHAR(50),
    location       VARCHAR(50),
    head_doctor_id INT,
    FOREIGN KEY (head_doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO departments (dept_id, dept_name, location, head_doctor_id)
VALUES
(1, 'Cardiology',   'Block A', 1),
(2, 'Neurology',    'Block B', 3),
(3, 'Orthopaedics', 'Block C', 5),
(4, 'Paediatrics',  'Block D', 7);

-- ── TABLE: appointments ──────────────────────────────────────
CREATE TABLE appointments (
    appt_id    INT PRIMARY KEY,
    patient_id INT,
    doctor_id  INT,
    appt_date  DATE,
    status     VARCHAR(50),
    fee        DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES doctors(doctor_id)
);

INSERT INTO appointments (appt_id, patient_id, doctor_id, appt_date, status, fee)
VALUES
(1,  1,  1, '2024-01-10', 'Completed', 1500.00),
(2,  2,  3, '2024-01-15', 'Completed', 2000.00),
(3,  3,  1, '2024-01-20', 'Completed', 1500.00),
(4,  4,  5, '2024-02-05', 'Completed', 1800.00),
(5,  5,  3, '2024-02-10', 'Cancelled',  500.00),
(6,  6,  2, '2024-02-18', 'Completed', 1200.00),
(7,  7,  4, '2024-03-01', 'Completed', 2500.00),
(8,  8,  7, '2024-03-08', 'Pending',   1000.00),
(9,  9,  1, '2024-03-15', 'Completed', 1500.00),
(10, 10, 6, '2024-03-22', 'Completed', 1700.00),
(11, 11, 3, '2024-04-01', 'Pending',   2000.00),
(12, 12, 5, '2024-04-10', 'Completed', 1800.00),
(13, 13, 8, '2024-04-18', 'Completed',  900.00),
(14, 14, 2, '2024-05-02', 'Cancelled',  500.00),
(15, 15, 7, '2024-05-10', 'Completed', 1100.00),
(16, 1,  4, '2024-05-20', 'Completed', 2500.00),
(17, 3,  6, '2024-06-01', 'Pending',   1700.00),
(18, 5,  8, '2024-06-12', 'Completed',  900.00),
(19, 8,  1, '2024-06-25', 'Completed', 1500.00),
(20, 10, 5, '2024-07-04', 'Completed', 1800.00);


-- ============================================================
--  PRACTICE QUERIES
-- ============================================================

-- ── TOPIC 1: BASICS ──────────────────────────────────────────
SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM departments;
SELECT * FROM appointments;
SELECT name, blood_group FROM patients;
SELECT DISTINCT city FROM patients;
SELECT DISTINCT department FROM doctors;
SELECT name AS Doctor_name, salary AS Monthly_Pay FROM doctors;
SELECT name AS Doctor_name, department AS Specialisation FROM doctors;

-- ── TOPIC 2: FILTERING ───────────────────────────────────────
SELECT * FROM patients WHERE gender = 'Female' AND city = 'Mumbai';
SELECT * FROM appointments WHERE status IN ('Completed', 'Cancelled');
SELECT name, experience_yrs FROM doctors
    WHERE experience_yrs BETWEEN 5 AND 15 AND department = 'Cardiology';
SELECT patient_id, name FROM patients WHERE name LIKE '%Kumar%';
SELECT name, age FROM patients WHERE age > 60;
SELECT * FROM appointments WHERE status IN ('Pending', 'Scheduled');
SELECT name, salary FROM doctors WHERE salary > 80000 ORDER BY salary DESC;
SELECT name, blood_group FROM patients WHERE blood_group IN ('O+', 'O-');

-- ── TOPIC 3: SORTING & LIMITING ──────────────────────────────
SELECT name, age FROM patients ORDER BY age ASC;
SELECT * FROM patients ORDER BY name ASC;
SELECT appt_id, appt_date FROM appointments ORDER BY appt_date DESC LIMIT 5;
SELECT * FROM appointments ORDER BY fee DESC LIMIT 3;
SELECT name, department, experience_yrs FROM doctors
    ORDER BY department, experience_yrs DESC;
SELECT name, department, experience_yrs FROM doctors
    ORDER BY experience_yrs DESC LIMIT 5;

-- ── TOPIC 4: AGGREGATE FUNCTIONS ─────────────────────────────
SELECT COUNT(appt_id) AS total_appointments FROM appointments;
SELECT COUNT(appt_id) AS completed_count FROM appointments WHERE status = 'Completed';
SELECT ROUND(AVG(age), 1) AS average_age FROM patients;
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM doctors;
SELECT SUM(fee) AS total_revenue FROM appointments;
SELECT ROUND(AVG(fee), 2) AS avg_fee FROM appointments;

-- ── TOPIC 5: GROUPING ────────────────────────────────────────
SELECT status, COUNT(appt_id) AS count FROM appointments GROUP BY status;
SELECT department, ROUND(AVG(salary), 1) AS average_salary
    FROM doctors GROUP BY department;
SELECT department, COUNT(doctor_id) AS doc_count FROM doctors GROUP BY department;
SELECT gender, ROUND(AVG(age), 1) AS avg_age FROM patients GROUP BY gender;
SELECT department, SUM(salary) AS total_salary FROM doctors
    GROUP BY department HAVING total_salary > 150000;

-- ── TOPIC 6: Joins ────────────────────────────────────────
#List all appointments showing patient name, doctor name, and fee.#
select p.name as patient,
d.name as doctors,
a.fee from appointments a 
inner join patients p on a.patient_id = p.patient_id
inner join doctors d on a.doctor_id = d.doctor_id;

#Find all patients who have NEVER had an appointment (LEFT JOIN + IS NULL trick)#

select p.patient_id , p.city
from patients p 
left join appointments a on p.patient_id  = a.patient_id
where a.appt_id is null;

select distinct patient_id, status from appointments;
select * from patients;
select * from appointments;

#Show each doctor's name alongside their department location from the departments table#
select d.name as doctor_name ,d.department,dept.location
from doctors d 
inner join departments dept on d.department = dept.dept_name;

#Full appointment list: patient name, doctor name, department, date, fee, status#

select p.name,d.name as doctor_name,d.department,a.appt_date,a.status,a.fee
from appointments a
inner join  patients p on p.patient_id = a.patient_id
inner join  doctors d on d.doctor_id = a.doctor_id;

#Find patients who have visited the Cardiology department#
select distinct p.name , d.department
from appointments a
inner join patients p on p.patient_id = a.patient_id
inner join doctors d on d.doctor_id =  a.doctor_id
where department = 'Cardiology';

#Find all doctors who have zero appointments (LEFT JOIN + IS NULL)#
select d.name as doctor_name,a.appt_id
from doctors d 
left join appointments a on a.doctor_id = d.doctor_id
where a.appt_id is null;

select d.name , count(a.appt_id) as appointment_count
from doctors d 
left join appointments a on a.doctor_id = d.doctor_id
group by d.name;

#Total fees collected per department (JOIN + GROUP BY)#

select d.department, sum(a.fee) as total_fee
from doctors d
inner join  appointments a on d.doctor_id = a.doctor_id
group by department;

 #Show patient name, city and their appointment status#
 
 select distinct p.name,city,a.status
 from patients p
 left join	appointments a on p.patient_id = a.patient_id;
 
 #Show doctor name, department and their appointment fee#
 select d.name as doctor_name , d.department , sum(a.fee) as total_fee
 from doctors d
 left join appointments a on d.doctor_id = a.doctor_id
 group by d.name, d.department;
 
#Show all appointments with patient name and doctor name  only where status is Pending#
select p.name as paitent_name , d.name as doctor_name, a.status
from appointments a 
inner join patients p on p.patient_id = a.patient_id
inner join doctors d on d.doctor_id = a.doctor_id
where status = 'pending';

#Show patient name and the total number of appointments they have made#
Select p.name , count(a.appt_id) as total_appointment 
from patients p 
left join appointments a  on p.patient_id = a.patient_id
group by p.name;

#Show doctor name and total fees they collected ordered by highest fees first#
select d.name , sum(a.fee) as total_fee
from doctors d 
left join appointments a on d.doctor_id = a.doctor_id
group by d.name
order by total_fee desc;

#Find all female patients and their appointment details#
select p.name, a.appt_id , a.patient_id,a.doctor_id,a.appt_date,a.status,a.fee
from patients p
inner join appointments a on p.patient_id = a.patient_id
where p.gender = 'female';
 
 #Find all appointments made by patients from Chennai#
 select p.name ,  a.appt_id , a.patient_id,a.doctor_id,a.appt_date,a.status,a.fee
 from patients p 
 inner join appointments a on p.patient_id = a.patient_id
 where p.city = 'Chennai';
 
 #Find all Completed appointments where fee is above 1500 show patient name, doctor name and fee#
 select p.name as patient_name, d.name as doctor_name,a.fee
 from patients p 
 inner join appointments a  on p.patient_id = a.patient_id
 inner join  doctors d on d.doctor_id = a.doctor_id
 where a.fee > 1500 and a.status = 'Completed';
 
 #Find patients who visited doctors with more than  10 years experience#
 select  distinct (p.name) as patient_name ,d.name as doctor_name,d.experience_yrs
 from patients p 
 inner join appointments a on a.patient_id = p.patient_id
 inner  join doctors d on d.doctor_id = a.doctor_id
 where d.experience_yrs > 10;
 
 #Show total appointments per city (which city visits hospital the most?)#
 select p.city ,count(a.appt_id) as total_appointment 
 from patients p
 left join appointments a on p.patient_id = a.patient_id
 group by p.city
 order by total_appointment desc;
 
 #Find the most visited department#
select d.department, count(a.appt_id) as max_visited_dept 
from doctors d
left join appointments a on d.doctor_id = a.doctor_id
group by d.department
limit 1;

#Show patient name, doctor name and fee  for the top 3 most expensive appointments#
select distinct p.name as patient_name, d.name as doctor_name ,a.fee as total_fee
from appointments a
inner join patients p on p.patient_id = a.patient_id
inner join doctors d on d.doctor_id =  a.doctor_id
order by a.fee desc
limit 3 ;

#Find patients who have visited MORE THAN ONE department#
select p.name , count(DISTINCT d.department) as dept_count
from appointments a 
inner join patients p on p.patient_id = a.patient_id
inner join doctors d on d.doctor_id =  a.doctor_id
group by p.name
having dept_count > 1;

-- ── TOPIC 7: Subquerries ────────────────────────────────────────
-- Subquery in WHERE: doctors earning above average salary
select name ,salary
from doctors 
where salary < (select avg(salary) from doctors);

-- Subquery in SELECT: show each patient + total their appointments
select name,
(select count(*) from appointments a
where a.patient_id = p.patient_id) as total_appointment
from patients p;

-- EXISTS: patients who have at least one appointment
select name from patients p
where exists (select 1 from  appointments a 
where a.patient_id = p.patient_id
);

-- Find all appointments where the fee is above the average fee.
select * from appointments
where fee < (select avg(fee) from appointments);

-- Find the patient who paid the highest single appointment fee.
select p.name, a.fee
from patients p 
inner join	 appointments a on a.patient_id =p.patient_id
where a.fee = (select max(fee) from appointments);

 #Find patients who have NOT had any appointments using NOT EXISTS#
 select p.name from patients p
where not exists (select 1 from appointments a
where a.patient_id = p.patient_id);


#Find the doctor who handled the most expensive appointment#
select d.name , a.fee , a.appt_id
from doctors d 
inner join appointments a on a.doctor_id = d.doctor_id
where a.fee = (select max(fee) from appointments);

#List patients who visited doctors with above-average salaries#
select distinct p.name , d.salary  
from patients p
inner join appointments a on a.patient_id = p.patient_id
inner join doctors d on d.doctor_id = a.doctor_id
where d.salary > (select avg(salary) from doctors);

#Find departments where all doctors earn above 70,000#
select department 
from doctors 
group by department
having min(salary) > 70000;

#Find patients who are older than the average age of all patients#
select name ,age from patients
where age > (select avg(age) from patients);

# Find doctors whose salary is below the average salary#

select name , salary from doctors
where salary < (select avg(salary) from doctors);

#Find appointments where fee is equal to the minimum fee#
select appt_id,patient_id,fee from appointments
where  fee = (select min(fee) from appointments);
   
#Find the youngest patient's full details#
select * from patients 
where age = (select min(age) from patients);

#Q5: Find patients who have visited the highest paid doctor#
select p.name as patient_name , d.name as doctor_name, d.salary
from patients p
inner join appointments a on p.patient_id = a.patient_id
inner join doctors d on d.doctor_id  = a.doctor_id
where d.salary = (select max(salary) from doctors);

#Find all appointments made by patients from the city with the most patients#
select a.appt_id , p.city 
from appointments a 
inner join patients p on p.patient_id = a.patient_id
where p.city = (select city from patients
group by city
order by count(name) desc
limit 1);

#Find doctors who earn more than the highest paid  doctor in Paediatrics#

select name ,salary from doctors
where salary > (select max(salary) from doctors 
where department = 'Paediatrics' );

#Q8: Find doctors who have at least one Completed appointment using EXISTS#

select d.name 
from doctors d
where  exists (select 1 from appointments a 
where d.doctor_id = a.doctor_id
and a.status = 'Completed');

select name from patients p
where exists (select 1 from  appointments a 
where a.patient_id = p.patient_id
);

#Find patients who have NEVER visited Neurology department using NOT EXISTS
select p.name from patients p
where not exists (select 1 from appointments a 
join doctors d on d.doctor_id = a.doctor_id
where a.patient_id = p.patient_id
and d.department = 'Neurology');

-- UNION: all cities from patients + all locations from departments
select city as location from patients
union
select location from departments;



-- Which blood groups appear in both patients?
SELECT blood_group FROM patients WHERE gender = 'Male'
INTERSECT
SELECT blood_group FROM patients WHERE gender = 'Female';

SELECT city from patients
EXCEPT
Select location from departments;

select name from patients 
union 
select name from  doctors;

select fee from appointments where Year(appt_date)= 2023
union all
select fee from appointments where Year (appt_date) = 2024;

#Create a master people list with all patients and doctors (UNION)#
SELECT name, 'Patient' AS role FROM patients
UNION
SELECT name, 'Doctor' AS role FROM doctors;

-- Blood groups that appear in both male AND female patients
SELECT blood_group FROM patients WHERE gender = 'Male'
INTERSECT
SELECT blood_group FROM patients WHERE gender = 'Female';

#Find patient cities with no department coverage (EXCEPT — gap analysis!)#
SELECT city from patients
EXCEPT
Select location from departments;

-- ROW_NUMBER: assign a unique row number
select name,salary,
row_number() OVER (order by salary desc) AS row_num
from doctors;

-- RANK within each department
select name,department,salary,
RANK() over (partition by department ORDER BY  salary DESC) AS dept_rank
from doctors;

-- LAG: compare each appointment fee with the previous one
select appt_id , appt_date,fee,
LAG (fee) OVER (ORDER BY appt_date) AS prev_fee
FROM appointments;

-- Rank doctors by total fees they generated.
select doctor_id, fee ,
Rank () over (order by fee desc) as " Fee_generated"
from appointments;

#Assign ROW_NUMBER to patients ordered by registration date#
Select name,patient_id,
row_number() OVER (order by patient_id) As "Row number"
from patients;

#Use LEAD() to show the next appointment date for each patient#
select
patient_id,
appt_date AS current_visit,
LEAD(appt_date) OVER (partition by patient_id order by appt_date) AS "next visit"
FROM appointments;

#Show running total of appointment fees using SUM() OVER()#
select 
appt_id,
appt_date,
fee,
sum(fee) OVER (order by fee) AS "Running_total"
from appointments;


show tables;

-- CASE: categorise patients by age

SELECT name,age,
case
when age< 18 then "child"
when age between 18 AND 16 then "ADULT"
else "Senior"
END AS age_group
from patients;

-- CTE: top-earning doctors per department
with DeptMax AS(
Select department,max(salary) as "Max_salary"
from doctors
group by department
)

select d.department,d.name,d.salary
from doctors d 
join DeptMax dm on d.department = dm.department
and d.salary = dm. Max_salary;

-- VIEW: create a reusable appointment summary
create view	appointment_summary AS
SELECT p.name AS patient, d.name AS doctor,
d.department,a.appt_date,a.fee,a.status
from appointments a
join patients p ON a.patient_id = p.patient_id
join doctors d ON a.doctor_id = d.doctor_id;

select * from appointment_summary

select doctor_id,
count(CASE WHEN status = 'completed' THEN 1  END) AS Completed,
count(CASE WHEN status = 'Pending' THEN 1  END) AS Pending
from appointments
group by doctor_id;

select appt_id , fee,
case
when fee < 1000 then "low"
when fee between 1000 and 3000 then "Medium"
else "high "
end as salary_group
from appointments;

#Write a CTE to first get total fees per doctor, then show only those who collected more than 50,000#

with Totalfee AS(
select doctor_id,sum(fee) as "fee_per_doctor"
from appointments
group by doctor_id
)

Select d.name,TF.fee_per_doctor
 from Totalfee TF
 join doctors d on TF.doctor_id = d.doctor_id
 where TF.fee_per_doctor < 50000
 Order by TF.fee_per_doctor desc;

#Create a VIEW called active_patients that shows patients who have had at least one appointment in the last year#
CREATE VIEW  active_patients AS
SELECT p.name AS patient , a.appt_id
from appointments a 
join patients p on a.patient_id = p.patient_id
where a.status in ('Completed' , 'Pending')
AND a.appt_date>= DATE_SUB(curdate(),interval 1 year);

select * from active_patients;
drop view active_patients;

#Write a CTE to find the total number of appointments per patient, then show only patients who have more than 1 appointment#

WITH Total_appointment AS (
select patient_id, COUNT(appt_id) AS "total_appts"
from appointments 
group by patient_id 
)

select p.name ,  TA.total_appts
from Total_appointment TA
JOIN patients P on P.patient_id = TA.patient_id 
where TA.patient_id >1 ;

#Write a CTE to calculate average salary per department, then join with the departments table to show the department name and location alongside the average salary.#
with salryperdept AS( 
select department , round (avg(salary))AS "average_salary"
from doctors
group by department
)

select d.dept_name ,d.location , SD.average_salary
from salryperdept SD
join departments d on d.dept_name = SD.department;

#Q3 — Multiple CTEs Write two CTEs First CTE: total fees collected per doctor Second CTE: average fee per patient Then show both results side by side.#

WITH TotalDoctorfee AS (
select doctor_id , round(sum(fee)) AS "Total_fee"
from appointments a
group by doctor_id
),
Avgpatientfee AS (
select patient_id , round(avg(fee))as "Avg_fee"
from appointments a
group by patient_id
)

select d.name , p.name , TF.Total_fee ,AF.Avg_fee
from appointments a 
join TotalDoctorfee TF on TF.doctor_id = a.doctor_id
join doctors d on d.doctor_id = a.doctor_id
join Avgpatientfee AF ON AF.patient_id = a.patient_id
join patients p on p.patient_id = a.patient_id;


#CASE: Create patient risk categories based on age and visit frequency#

select name,age,
case 
when age > 60 then 'High_Risk'
when age between 40 and 60 then 'medium_risk'
else 'low_risk'
END AS age_group,
case 
when count(a.appt_id)>1 then 'high'
else 'rare'
END AS vist_frequency
from patients p
join appointments a on a.patient_id =p.patient_id
group by p.age,p.name,p.patient_id
order by age;

#CTE: Build a monthly revenue report using a CTE for sub-totals#

with MonthlyRevenue AS(
select 
year(appt_date) AS "Appt_year",
Month(appt_date) AS "appt_month",
SUM(fee) AS "Total_revenue"
from appointments
group by Appt_year,appt_month
)

select * from MonthlyRevenue
order by Appt_year,appt_month;

#VIEW: Create doctor_performance_view showing doctor name, department, total appointments, total revenue, and rank#

create view doctor_performance AS
select d.name AS "doctor",
d.department, count(a.appt_id) as "Total appointments",
SUM(fee) AS "Total_revenue",
rank() over(order by SUM(fee) desc) as "revenue rank"
from appointments a 
join doctors d on a.doctor_id = d.doctor_id
group by d.name , d.department;

select* from doctor_performance;

drop view doctor_performance;

#Window Functions: Running total of hospital revenue by month#
select 
year(appt_date),
Month(appt_date),
sum(fee) OVER (order by year (appt_date), Month(appt_date)) as "Revenue by month"
from appointments;

#Conditional Aggregation: Pivot-style report — count of Completed / Pending / Cancelled per department#
select d.department,
Count(case when a.status = 'Completed'Then 1 END ) AS "Completed",
count(case when a.status = 'Pending'Then 1 END ) AS " Pending",
count(case when a.status = 'Cancelled'Then 1 END ) AS "Cancelled"
from appointments a
join doctors d on d.doctor_id = a.doctor_id
group by department;

#Full JOIN + GROUP BY + HAVING: Find departments where completed appointment fees exceed 100,00#
select d.department ,sum(a.fee) as "total fee"
from doctors d  
join appointments a on a.doctor_id = d.doctor_id
group by d.department;
HAVING SUM(fee) > 3000;


