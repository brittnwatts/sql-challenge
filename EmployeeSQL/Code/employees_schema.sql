CREATE TABLE salaries (
    emp_no SERIAL  NOT NULL,
    salary int   NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR(5)   NOT NULL,
    title VARCHAR(20)   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title VARCHAR(20)   NOT NULL,
    birth_date VARCHAR(20)   NOT NULL,
    first_name VARCHAR(20)   NOT NULL,
    last_name VARCHAR(20)   NOT NULL,
    sex VARCHAR(5)   NOT NULL,
    hire_date VARCHAR(20)   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title) REFERENCES titles(title_id),
	FOREIGN KEY(emp_no) REFERENCES salaries(emp_no)
);

CREATE TABLE departments (
    dept_no VARCHAR(5)   NOT NULL,
    dept_name VARCHAR(20)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(5)   NOT NULL,
    emp_no int   NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no)
);