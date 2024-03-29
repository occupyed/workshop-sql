-- Database
-- Create DB
CREATE DATABASE databasename;

-- Drop DB
DROP DATABASE databasename;

USE database_name;

---------------------------------------

-- Table
/*
Create Table

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
*/

CREATE TABLE Persons (
    person_id int,
    last_name varchar(255),
    first_name varchar(255),
    address varchar(255),
    city varchar(255)
);

-- check metadata
DESCRIBE table_name;

-- check metadata
SHOW COLUMNS FROM table_name;


-- Create table from existing table
CREATE TABLE TestTable AS SELECT customername, contactname FROM customers;

-- Drop table
DROP TABLE table_name;

-- truncate table
TRUNCATE TABLE table_name;

-- Alter table
-- add column
ALTER TABLE Customers ADD email varchar(255);

--  delete column
ALTER TABLE Customers DROP COLUMN email;

-- Change data types
ALTER TABLE Persons MODIFY COLUMN date_of_birth date;

-- rename column;
ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;

