-- ============================================================
--  MY SQL LEARNING JOURNEY — CLEAN QUERY FILE
--  Recovered & organized from MySQL Workbench history
--  Databases: hospital_data | studentsdb | sales_management
-- ============================================================


-- ============================================================
-- DATABASE 1: HOSPITAL_DATA
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


-- ── PRACTICE QUERIES: TOPIC 1 — BASICS ──────────────────────
SELECT * FROM patients;
SELECT name, blood_group FROM patients;
SELECT DISTINCT city FROM patients;
SELECT DISTINCT department FROM doctors;
SELECT name AS Doctor_name, salary AS Monthly_Pay FROM doctors;
SELECT name AS Doctor_name, department AS Specialisation FROM doctors;

-- ── PRACTICE QUERIES: TOPIC 2 — FILTERING ───────────────────
SELECT * FROM patients WHERE gender = 'Female' AND city = 'Mumbai';
SELECT * FROM appointments WHERE status IN ('Completed', 'Cancelled');
SELECT name, experience_yrs FROM doctors
    WHERE experience_yrs BETWEEN 5 AND 15 AND department = 'Cardiology';
SELECT patient_id, name FROM patients WHERE name LIKE '%Kumar%';
SELECT name, age FROM patients WHERE age > 60;
SELECT * FROM appointments WHERE status IN ('Pending', 'Scheduled');
SELECT name, salary FROM doctors WHERE salary > 80000 ORDER BY salary DESC;
SELECT name, blood_group FROM patients WHERE blood_group IN ('O+', 'O-');

-- ── PRACTICE QUERIES: TOPIC 3 — SORTING & LIMITING ──────────
SELECT name, age FROM patients ORDER BY age ASC;
SELECT name, age FROM patients ORDER BY age DESC;
SELECT * FROM patients ORDER BY name ASC;
SELECT appt_id, appt_date FROM appointments ORDER BY appt_date DESC LIMIT 5;
SELECT name, department, experience_yrs FROM doctors
    ORDER BY department, experience_yrs DESC;
SELECT * FROM appointments ORDER BY fee DESC LIMIT 3;
SELECT experience_yrs, name FROM doctors ORDER BY experience_yrs DESC LIMIT 5;

-- ── PRACTICE QUERIES: TOPIC 4 — AGGREGATE FUNCTIONS ─────────
SELECT COUNT(appt_id) AS total_appointments FROM appointments;
SELECT COUNT(appt_id) FROM appointments WHERE status = 'Completed';
SELECT ROUND(AVG(age), 1) AS average_age FROM patients;
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM doctors;
SELECT SUM(fee) AS total_revenue FROM appointments;

-- ── PRACTICE QUERIES: TOPIC 5 — GROUPING ────────────────────
SELECT status, COUNT(appt_id) AS count FROM appointments GROUP BY status;
SELECT department, ROUND(AVG(salary), 1) AS average_salary
    FROM doctors GROUP BY department;
SELECT department, COUNT(doctor_id) AS doc_count FROM doctors GROUP BY department;
SELECT gender, AVG(age) FROM patients GROUP BY gender ORDER BY gender DESC;
SELECT department, SUM(salary) AS total_salary FROM doctors
    GROUP BY department HAVING total_salary > 150000;


-- ============================================================
-- DATABASE 2: STUDENTSDB
-- ============================================================

CREATE DATABASE studentsdb;
USE studentsdb;

-- ── TABLE: students ──────────────────────────────────────────
CREATE TABLE students (
    studentid  INT AUTO_INCREMENT PRIMARY KEY,
    firstname  VARCHAR(50),
    lastname   VARCHAR(50),
    birthdate  DATE,
    gender     VARCHAR(10)
);

INSERT INTO students (firstname, lastname, birthdate, gender)
VALUES
('John',    'Doe',       '2000-05-15', 'Male'),
('Jane',    'Smith',     '2002-11-09', 'Female'),
('Emily',   'Johnson',   '2001-07-22', 'Female'),
('Michael', 'William',   '2000-12-30', 'Male'),
('Sarah',   'Brown',     '1998-10-10', 'Female'),
('David',   'Jones',     '2002-03-25', 'Male'),
('Emma',    'Garcia',    '2000-11-08', 'Female'),
('James',   'Martinez',  '1999-01-01', 'Male'),
('Olivia',  'Hernandez', '2001-08-30', 'Female'),
('William', 'Lopez',     '2000-02-14', 'Male');

-- ── TABLE: courses ───────────────────────────────────────────
CREATE TABLE courses (
    courseid   INT AUTO_INCREMENT PRIMARY KEY,
    coursename VARCHAR(50),
    credits    INT
);

INSERT INTO courses (coursename, credits)
VALUES
('Maths',            3),
('Computer Science', 4),
('Biology',          3),
('Chemistry',        4),
('Physics',          3),
('Literature',       2),
('History',          3),
('Economics',        3),
('Engineering',      4),
('Data Science',     4);

-- ── TABLE: enrollment ────────────────────────────────────────
CREATE TABLE enrollment (
    enrollmentid   INT AUTO_INCREMENT PRIMARY KEY,
    studentid      INT,
    courseid       INT,
    enrollmentdate DATE,
    FOREIGN KEY (studentid) REFERENCES students(studentid),
    FOREIGN KEY (courseid)  REFERENCES courses(courseid)
);

INSERT INTO enrollment (studentid, courseid, enrollmentdate)
VALUES
(1,  1, '2021-08-20'),
(1,  2, '2021-08-20'),
(2,  1, '2021-08-20'),
(2,  3, '2021-08-20'),
(3,  4, '2021-08-20'),
(4,  2, '2022-01-15'),
(5,  3, '2021-08-20'),
(6,  5, '2022-01-15'),
(7,  6, '2021-08-20'),
(8,  7, '2022-01-15'),
(9,  8, '2021-08-20'),
(10, 9, '2022-01-15');


-- ============================================================
-- DATABASE 3: SALES_MANAGEMENT
-- ============================================================

CREATE DATABASE sales_management;
USE sales_management;

-- ── TABLE: productlines ──────────────────────────────────────
CREATE TABLE productlines (
    productLine     VARCHAR(50) PRIMARY KEY,
    textDescription TEXT,
    htmlDescription TEXT,
    image           MEDIUMBLOB
);

INSERT INTO productlines (productLine, textDescription, htmlDescription, image)
VALUES
('Classic Cars',  'Vintage and classic model cars', NULL, NULL),
('Motorcycles',   'Racing and sports bikes',        NULL, NULL);

-- ── TABLE: products ──────────────────────────────────────────
CREATE TABLE products (
    productCode        VARCHAR(50) PRIMARY KEY,
    productName        VARCHAR(100),
    productLine        VARCHAR(50),
    productScale       VARCHAR(50),
    productVendor      VARCHAR(50),
    productDescription LONGTEXT,
    quantityInStock    INT,
    buyPrice           DECIMAL(10,2),
    MSRP               DECIMAL(10,2),
    FOREIGN KEY (productLine) REFERENCES productlines(productLine)
);

INSERT INTO products (productCode, productName, productLine, productScale,
                      productVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES
('S10_1678', '1969 Harley Davidson', 'Motorcycles',  '1:10', 'Min Lin Diecast',
 'Classic Harley Davidson bike model', 100, 4800, 6500),
('S12_1099', '1968 Ford Mustang',    'Classic Cars', '1:12', 'Autoart Studio',
 'Classic Ford Mustang model',         50,  9500, 12000);

-- ── TABLE: office ────────────────────────────────────────────
CREATE TABLE office (
    officeCode   VARCHAR(50) PRIMARY KEY,
    city         VARCHAR(50),
    phone        VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    state        VARCHAR(50),
    country      VARCHAR(50),
    postalCode   VARCHAR(50),
    territory    VARCHAR(50)
);

INSERT INTO office (officeCode, city, phone, addressLine1, addressLine2,
                    state, country, postalCode, territory)
VALUES
('1', 'Chennai',   '+91-44-12345678', 'T Nagar', NULL, 'Tamil Nadu', 'India', '600017', 'APAC'),
('2', 'Bangalore', '+91-80-87654321', 'MG Road', NULL, 'Karnataka', 'India',  '560001', 'APAC');

-- ── TABLE: Employees ─────────────────────────────────────────
CREATE TABLE Employees (
    employeeNumber INT          NOT NULL PRIMARY KEY,
    lastName       VARCHAR(50)  NOT NULL,
    firstName      VARCHAR(50)  NOT NULL,
    extension      VARCHAR(50),
    email          VARCHAR(50),
    officeCode     VARCHAR(50)  NOT NULL,
    reportsTo      INT,
    jobTitle       VARCHAR(50),
    FOREIGN KEY (officeCode) REFERENCES office(officeCode),
    FOREIGN KEY (reportsTo)  REFERENCES Employees(employeeNumber)
);

INSERT INTO Employees (employeeNumber, lastName, firstName, extension,
                       email, officeCode, reportsTo, jobTitle)
VALUES
(1002, 'Kumar',  'Arun',   'x101', 'arun.kumar@classic.com',   '1', NULL, 'Sales Manager'),
(1056, 'Ravi',   'Suresh', 'x102', 'suresh.ravi@classic.com',  '1', 1002, 'Sales Rep'),
(1076, 'Sharma', 'Neha',   'x103', 'neha.sharma@classic.com',  '2', 1002, 'Sales Rep');

-- ── TABLE: customers ─────────────────────────────────────────
CREATE TABLE customers (
    customerNumber          INT PRIMARY KEY,
    customerName            VARCHAR(50),
    contactLastName         VARCHAR(50),
    contactFirstName        VARCHAR(50),
    phone                   VARCHAR(50),
    addressLine1            VARCHAR(50),
    addressLine2            VARCHAR(50),
    city                    VARCHAR(50),
    state                   VARCHAR(50),
    postalCode              VARCHAR(50),
    country                 VARCHAR(50),
    salesRepEmployeeNumber  INT,
    creditLimit             DECIMAL(10,2),
    FOREIGN KEY (salesRepEmployeeNumber) REFERENCES Employees(employeeNumber)
);

INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName,
                       phone, addressLine1, addressLine2, city, state,
                       postalCode, country, salesRepEmployeeNumber, creditLimit)
VALUES
(2001, 'ABC Traders',     'Rao',   'Vikram', '+91-9876543210', 'Anna Nagar',  NULL,
 'Chennai',   'Tamil Nadu', '600040', 'India', 1056, 150000),
(2002, 'XYZ Electronics', 'Patel', 'Amit',   '+91-9123456789', 'Indiranagar', NULL,
 'Bangalore', 'Karnataka',  '560038', 'India', 1076, 200000);

-- ── TABLE: Orders ────────────────────────────────────────────
CREATE TABLE Orders (
    orderNumber  INT  PRIMARY KEY,
    orderDate    DATE NOT NULL,
    requiredDate DATE NOT NULL,
    shippedDate  DATE,
    status       VARCHAR(50),
    comments     TEXT,
    customerNumber INT NOT NULL
);

INSERT INTO Orders (orderNumber, orderDate, requiredDate, shippedDate,
                    status, comments, customerNumber)
VALUES
(30001, '2026-01-10', '2026-01-15', '2026-01-13', 'Shipped',    'Delivered on time', 2001),
(30002, '2026-01-12', '2026-01-18', NULL,          'In Process', NULL,                2002);

-- ── TABLE: orderdetails ──────────────────────────────────────
CREATE TABLE orderdetails (
    orderNumber     INT          NOT NULL,
    productCode     VARCHAR(20)  NOT NULL,
    quantityOrdered INT,
    priceEach       DECIMAL(10,2),
    orderLineNumber SMALLINT,
    PRIMARY KEY (orderNumber, productCode),
    FOREIGN KEY (orderNumber)  REFERENCES Orders(orderNumber),
    FOREIGN KEY (productCode)  REFERENCES products(productCode)
);

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES
(30001, 'S10_1678', 2, 6500,  1),
(30002, 'S12_1099', 1, 12000, 1);

-- ── TABLE: Payments ──────────────────────────────────────────
CREATE TABLE Payments (
    customerNumber INT         NOT NULL,
    checkNumber    VARCHAR(20) NOT NULL,
    paymentDate    DATE,
    amount         DECIMAL(10,2),
    PRIMARY KEY (checkNumber, customerNumber),
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

INSERT INTO Payments (customerNumber, checkNumber, paymentDate, amount)
VALUES
(2001, 'CHK1001', '2026-01-16', 13000),
(2002, 'CHK1002', '2026-01-17', 12000);

-- ── PRACTICE QUERIES: SALES_MANAGEMENT ──────────────────────
SELECT * FROM productlines;
SELECT * FROM products;
SELECT * FROM office;
SELECT * FROM Employees;
SELECT * FROM customers;
SELECT * FROM Orders;
SELECT * FROM orderdetails;
SELECT * FROM Payments;

-- Products with buyPrice > 80
SELECT productName, productLine, quantityInStock, buyPrice, MSRP
    FROM products WHERE buyPrice > 80;

-- Products sorted by buyPrice descending
SELECT productName, productLine, buyPrice, MSRP
    FROM products ORDER BY buyPrice DESC;

-- Customers with their sales rep names
SELECT
    c.customerNumber,
    c.customerName,
    CONCAT(e.firstName, ' ', e.lastName) AS salesperson,
    e.jobTitle
FROM customers c
JOIN Employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

-- Orders with customer names, sorted by date
SELECT
    o.orderNumber,
    c.customerName,
    o.orderDate,
    o.requiredDate,
    o.shippedDate
FROM Orders o
JOIN customers c ON o.customerNumber = c.customerNumber
ORDER BY o.orderDate DESC;
