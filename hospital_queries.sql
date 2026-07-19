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
