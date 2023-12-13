CREATE DATABASE firm;
USE firm;

CREATE TABLE employees(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    salary INT NOT NULL,
    deptid INT NOT NULL,
    FOREIGN KEY(deptid)REFERENCES departmants(deptid)
);

CREATE TABLE departmants(
	deptid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    deptname VARCHAR(255)NOT NULL
);

INSERT INTO employees(name, salary, deptid) VALUES("Alice", 50000, 1);
INSERT INTO employees(name, salary, deptid) VALUES("Bob", 60000, 2);
INSERT INTO employees(name, salary, deptid) VALUES("Charlie", 70000, 1);
INSERT INTO employees(name, salary, deptid) VALUES("David", 55000, 2);
INSERT INTO employees(name, salary, deptid) VALUES("Emily", 75000, 3);


SELECT deptname, ROUND(AVG(salary), 2) AS avg_salary
FROM departmants
JOIN employees ON departmants.deptid =  employees.deptid
GROUP BY departmants.deptid;