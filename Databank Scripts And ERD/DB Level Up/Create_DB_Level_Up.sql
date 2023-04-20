-- ******************************
-- DROP Tables
-- ******************************
DROP TABLE IF EXISTS function CASCADE;
DROP TABLE IF EXISTS tasks CASCADE;
DROP TABLE IF EXISTS location CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
-- ******************************
-- DELETE Attribuut
-- ******************************
DELETE FROM function;
DELETE FROM tasks;
DELETE FROM location;
DELETE FROM employees;
-- ******************************
-- CREATE Tables
-- ******************************
CREATE TABLE function(
    function_id INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 1) CONSTRAINT PK_function PRIMARY KEY,
    function_name VARCHAR(25),
    description VARCHAR(200)
);
CREATE TABLE tasks(
    function_id INTEGER CONSTRAINT fk_function_tasks REFERENCES function(function_id),
    tasks_name VARCHAR(25),
    description VARCHAR(200)
);
CREATE TABLE location(
    function_id INTEGER CONSTRAINT fk_function_location REFERENCES function(function_id),
    street VARCHAR(50),
    city VARCHAR(25),
    postal_code CHAR(4)
);
CREATE TABLE employees(
    employee_id INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 1) CONSTRAINT PK_employees PRIMARY KEY,
    last_name VARCHAR(25),
    first_name VARCHAR(25),
    function_id INTEGER CONSTRAINT fk_function_employees REFERENCES function(function_id),
    gender CHAR(1) CONSTRAINT C_gender CHECK (gender IN ('F','M','X')) DEFAULT 'X',
    salary NUMERIC(6,2) CONSTRAINT c_salary CHECK (salary > 2000.00),
    street VARCHAR(50),
    city VARCHAR(25),
    postal_code CHAR(4),
    birth_data DATE
);