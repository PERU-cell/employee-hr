CREATE TABLE departments (
    dept_id     INT AUTO_INCREMENT PRIMARY KEY,
    dept_name   VARCHAR(100) NOT NULL UNIQUE,
    location    VARCHAR(100)
);

-- ============================================
-- 2. JOBS / POSITIONS
-- ============================================
CREATE TABLE jobs (
    job_id      INT AUTO_INCREMENT PRIMARY KEY,
    job_title   VARCHAR(100) NOT NULL,
    min_salary  DECIMAL(10,2),
    max_salary  DECIMAL(10,2)
);

-- ============================================
-- 3. EMPLOYEES
-- ============================================
CREATE TABLE employees (
    emp_id          INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    phone           VARCHAR(15),
    date_of_birth   DATE,
    gender          ENUM('Male', 'Female', 'Other'),
    hire_date       DATE DEFAULT (CURRENT_DATE),
    dept_id         INT,
    job_id          INT,
    manager_id      INT,                          -- self-reference
    status          ENUM('Active', 'Resigned', 'Terminated') DEFAULT 'Active',
    FOREIGN KEY (dept_id)    REFERENCES departments(dept_id) ON DELETE SET NULL,
    FOREIGN KEY (job_id)     REFERENCES jobs(job_id)         ON DELETE SET NULL,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)    ON DELETE SET NULL
);

-- ============================================
-- 4. SALARIES
-- ============================================
CREATE TABLE salaries (
    salary_id   INT AUTO_INCREMENT PRIMARY KEY,
    emp_id      INT NOT NULL,
    basic_pay   DECIMAL(10,2) NOT NULL,
    bonus       DECIMAL(10,2) DEFAULT 0,
    deductions  DECIMAL(10,2) DEFAULT 0,
    net_pay     DECIMAL(10,2) GENERATED ALWAYS AS (basic_pay + bonus - deductions) STORED,
    pay_month   VARCHAR(20)   NOT NULL,           -- e.g. 'June 2025'
    paid_on     DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);

-- ============================================
-- 5. LEAVES
-- ============================================
CREATE TABLE leaves (
    leave_id    INT AUTO_INCREMENT PRIMARY KEY,
    emp_id      INT  NOT NULL,
    leave_type  ENUM('Sick', 'Casual', 'Annual', 'Unpaid') NOT NULL,
    start_date  DATE NOT NULL,
    end_date    DATE NOT NULL,
    reason      VARCHAR(255),
    status      ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);

-- ============================================
-- 6. ATTENDANCE
-- ============================================
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id        INT  NOT NULL,
    date          DATE NOT NULL,
    check_in      TIME,
    check_out     TIME,
    status        ENUM('Present', 'Absent', 'Half Day', 'On Leave') NOT NULL,
    UNIQUE KEY uq_attendance (emp_id, date),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);

-- ============================================
-- 7. PERFORMANCE REVIEWS
-- ============================================
CREATE TABLE performance_reviews (
    review_id       INT AUTO_INCREMENT PRIMARY KEY,
    emp_id          INT NOT NULL,
    review_year     YEAR NOT NULL,
    rating          TINYINT CHECK (rating BETWEEN 1 AND 5),  -- 1=Poor, 5=Excellent
    comments        VARCHAR(500),
    reviewed_by     INT,   -- manager emp_id
    FOREIGN KEY (emp_id)      REFERENCES employees(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewed_by) REFERENCES employees(emp_id) ON DELETE SET NULL
);
