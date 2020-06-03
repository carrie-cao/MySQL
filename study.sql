create database if not exists sales; 
create schema if not exists sales;
use sales;
create table sales
(
purchase_number INT not null primary key auto_increment,
date_of_purchase date not null,
customer_id int,
item_code varchar(10) not null
);
create table customers
(
customer_id int,
 first_name varchar(225),
 last_name varchar(225),
 email_address varchar(225),
 number_of_complaints int
 );
use sales;
select * from sales;
select * from sales.sales;
DROP TABLE sales;
create table sales
(
purchase_number INT not null ,
date_of_purchase date not null,
customer_id int,
item_code varchar(10) not null,
primary key (purchase_number)
);

drop table sales.customers;
create table customers
(
customer_id int,
 first_name varchar(225),
 last_name varchar(225),
 email_address varchar(225),
 number_of_complaints int,
 primary key(customer_id)
 );
 CREATE TABLE items   
(  
    item_code varchar(255),   
    item varchar(255),  
    unit_price numeric(10,2),   
    company_id varchar(255),
primary key (item_code)  
);  

    CREATE TABLE companies 
(
    company_id varchar(255),  
    company_name varchar(255),  
    headquarters_phone_number int(12),  
primary key (company_id)   
);
DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);
ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0)
;
CREATE TABLE companies
(
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id),
UNIQUE KEY (headquarters_phone_number)
);
DROP TABLE companies;
ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;
ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;