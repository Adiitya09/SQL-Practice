create database customer;
use customer;

create table Customers ( C_id int, C_name varchar(10));

INSERT INTO Customers VALUES
(101, 'Aditya'),
(102, 'Rahul'),
(103, 'Priya'),
(104, 'Sneha'),
(105, 'Amit'),
(106, 'Neha'),
(107, 'Rohit'),
(108, 'Pooja'),
(109, 'Karan'),
(110, 'Anjali');

create table C_Order ( order_id int, C_id int, amount int);
INSERT INTO C_Order VALUES
(1, 101, 1500),
(2, 102, 2500),
(3, 101, 3000),
(4, 103, 4500),
(5, 104, 1200),
(6, 105, 5000),
(7, 102, 1800),
(8, 106, 700),
(9, 107, 3500),
(10, 101, 2200),
(11, 108, 900),
(12, 109, 4100),
(13, 110, 6000),
(14, 105, 2000),
(15, 103, 1700);

select * from Customers;

alter table C_order rename column C_id to Customer_id;

select * from Customers join C_Order on (C_id = Customer_id);

select C_name, amount from Customers left join C_Order on (C_id = Customer_id);

select C_name, amount from Customers right join C_Order on (C_id = Customer_id);

select * from Customers inner join  C_Order on (C_id = Customer_id);

select * from Customers full join  C_Order on (C_id = Customer_id);

