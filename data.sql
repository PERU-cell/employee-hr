
INSERT INTO departments (dept_name, location) VALUES
('Human Resources',   'Mumbai'),
('Engineering',       'Pune'),
('Sales',             'Delhi'),
('Finance',           'Mumbai'),
('Marketing',         'Bangalore');

INSERT INTO jobs (job_title, min_salary, max_salary) VALUES
('HR Manager',         50000, 90000),
('Software Engineer',  60000, 120000),
('Sales Executive',    35000, 70000),
('Accountant',         40000, 80000),
('Marketing Analyst',  45000, 85000),
('Team Lead',          80000, 140000),
('Junior Developer',   40000, 70000);

-- Managers first (no manager_id yet)
INSERT INTO employees (first_name, last_name, email, phone, date_of_birth, gender, hire_date, dept_id, job_id, manager_id) VALUES
('Anjali',  'Desai',   'anjali.desai@company.com',   '9000000001', '1985-03-10', 'Female', '2015-06-01', 1, 1, NULL),
('Vikram',  'Rao',     'vikram.rao@company.com',     '9000000002', '1980-07-22', 'Male',   '2013-01-15', 2, 6, NULL),
('Neha',    'Joshi',   'neha.joshi@company.com',     '9000000003', '1983-11-05', 'Female', '2014-03-20', 3, 6, NULL),
('Suresh',  'Kumar',   'suresh.kumar@company.com',   '9000000004', '1979-09-18', 'Male',   '2012-08-10', 4, 4, NULL);

-- Regular employees
INSERT INTO employees (first_name, last_name, email, phone, date_of_birth, gender, hire_date, dept_id, job_id, manager_id) VALUES
('Riya',    'Shah',    'riya.shah@company.com',      '9000000005', '1998-04-14', 'Female', '2022-07-01', 2, 7, 2),
('Aditya',  'Patil',   'aditya.patil@company.com',   '9000000006', '1997-12-30', 'Male',   '2021-09-15', 2, 2, 2),
('Pooja',   'Nair',    'pooja.nair@company.com',     '9000000007', '1999-06-08', 'Female', '2023-01-10', 3, 3, 3),
('Rahul',   'Mehta',   'rahul.mehta@company.com',    '9000000008', '1996-02-25', 'Male',   '2020-05-20', 3, 3, 3),
('Sana',    'Khan',    'sana.khan@company.com',      '9000000009', '2000-08-17', 'Female', '2023-06-01', 5, 5, NULL),
('Aryan',   'Verma',   'aryan.verma@company.com',    '9000000010', '1995-10-03', 'Male',   '2019-11-11', 4, 4, 4);

INSERT INTO salaries (emp_id, basic_pay, bonus, deductions, pay_month, paid_on) VALUES
(1, 85000, 5000, 3000, 'June 2025', '2025-06-30'),
(2, 130000, 10000, 5000, 'June 2025', '2025-06-30'),
(3, 75000, 4000, 2500, 'June 2025', '2025-06-30'),
(4, 72000, 3000, 2000, 'June 2025', '2025-06-30'),
(5, 45000, 2000, 1500, 'June 2025', '2025-06-30'),
(6, 90000, 6000, 3500, 'June 2025', '2025-06-30'),
(7, 38000, 1000, 1000, 'June 2025', '2025-06-30'),
(8, 42000, 1500, 1200, 'June 2025', '2025-06-30'),
(9, 50000, 2500, 1800, 'June 2025', '2025-06-30'),
(10, 65000, 3000, 2200, 'June 2025', '2025-06-30');

INSERT INTO leaves (emp_id, leave_type, start_date, end_date, reason, status) VALUES
(5, 'Sick',   '2025-06-10', '2025-06-11', 'Fever',           'Approved'),
(7, 'Casual', '2025-06-15', '2025-06-15', 'Personal work',   'Approved'),
(8, 'Annual', '2025-06-20', '2025-06-25', 'Family vacation',  'Pending'),
(9, 'Sick',   '2025-06-05', '2025-06-06', 'Not feeling well', 'Approved');

INSERT INTO attendance (emp_id, date, check_in, check_out, status) VALUES
(1, '2025-06-23', '09:00:00', '18:00:00', 'Present'),
(2, '2025-06-23', '08:45:00', '17:30:00', 'Present'),
(3, '2025-06-23', '09:10:00', '18:15:00', 'Present'),
(5, '2025-06-23', NULL,       NULL,       'Absent'),
(6, '2025-06-23', '09:00:00', '18:00:00', 'Present'),
(7, '2025-06-23', '09:30:00', '13:30:00', 'Half Day');

INSERT INTO performance_reviews (emp_id, review_year, rating, comments, reviewed_by) VALUES
(5,  2024, 4, 'Good progress, meets expectations',          2),
(6,  2024, 5, 'Exceptional performance, promoted candidate', 2),
(7,  2024, 3, 'Satisfactory, needs to improve delivery',    3),
(8,  2024, 4, 'Consistent performer, good team player',     3),
(10, 2024, 5, 'Outstanding, handles complex tasks well',    4);