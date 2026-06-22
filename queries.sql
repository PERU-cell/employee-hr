SELECT e.emp_id,
       CONCAT(e.first_name, ' ', e.last_name) AS employee,
       d.dept_name, j.job_title, e.status
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN jobs        j ON e.job_id  = j.job_id
ORDER BY d.dept_name;

-- 2. Employee with their manager name
SELECT CONCAT(e.first_name, ' ', e.last_name)  AS employee,
       CONCAT(m.first_name, ' ', m.last_name)  AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- 3. Salary report for June 2025
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee,
       s.basic_pay, s.bonus, s.deductions, s.net_pay, s.pay_month
FROM salaries s
JOIN employees e ON s.emp_id = e.emp_id
WHERE s.pay_month = 'June 2025'
ORDER BY s.net_pay DESC;

-- 4. Department-wise total salary cost
SELECT d.dept_name,
       COUNT(e.emp_id)          AS total_employees,
       SUM(s.net_pay)           AS total_salary_cost,
       ROUND(AVG(s.net_pay), 2) AS avg_salary
FROM salaries s
JOIN employees   e ON s.emp_id  = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id
WHERE s.pay_month = 'June 2025'
GROUP BY d.dept_name
ORDER BY total_salary_cost DESC;

-- 5. Leave summary per employee
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee,
       l.leave_type,
       DATEDIFF(l.end_date, l.start_date) + 1 AS days_taken,
       l.status
FROM leaves l
JOIN employees e ON l.emp_id = e.emp_id
ORDER BY employee;

-- 6. Attendance for a specific date
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee,
       a.check_in, a.check_out, a.status
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
WHERE a.date = '2025-06-23';

-- 7. Top performers (rating 4 or 5)
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee,
       d.dept_name, pr.rating, pr.comments, pr.review_year
FROM performance_reviews pr
JOIN employees   e ON pr.emp_id  = e.emp_id
JOIN departments d ON e.dept_id  = d.dept_id
WHERE pr.rating >= 4
ORDER BY pr.rating DESC;

-- 8. Employees with pending leave requests
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee,
       l.leave_type, l.start_date, l.end_date, l.reason
FROM leaves l
JOIN employees e ON l.emp_id = e.emp_id
WHERE l.status = 'Pending';
