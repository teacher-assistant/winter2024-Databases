# Use the database
use comp353lab;

# drop the target tables if exists
drop table if exists customers, orders;

# Creating of the tables + Insertion of the date to them
create table customers(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    password varchar(50),
    country varchar(50),
    balance int
);

insert into customers(first_name, last_name, email, password, country, balance) values
                        ('Omid Reza', 'Heidari', 'omid.orh@gmail.com', 'password1', 'Iran', 2000),
                        ('Ali', 'Amiri', 'ali@gmail.com', 'password2', 'Canada', 3000),
                        ('Ali', 'Ahmad', 'ali.ahmad@gmail.com', 'password2', 'Iraq', 4500),
                        ('John', 'Nash', 'nash@gmail.com', 'password3', 'Denmark', 1400),
                        ('Pari', 'Amin', 'pr.am@gmail.com', 'password4', 'Iran', 4200),
                        ('David', 'Ahmad', 'dmp.mmd@gmail.com', 'password5', 'Canada', 300);

create table orders(
    id int primary key auto_increment,
    customer_id int,
    amount int,
    units int,
    created_at datetime,
    ship_to varchar(50),
    foreign key (customer_id) references customers(id) on delete cascade on update cascade
);


insert into orders(customer_id, amount, created_at, ship_to, units)
            VALUES (1, 200, '2022-02-02 10:00:00.000000', 'Canada', 2),
                    (2, 2000, '2024-02-02 19:00:00.000000', NULL, 4),
                    (1, 230, '2024-02-01 01:00:00.000000', NULL, NULL),
                    (4, 400, '2021-02-02 13:00:00.000000', NULL, 30),
                    (2, 500, '1999-02-02 22:00:00.000000', 'Iran', 2),
                    (1, 100, '2002-02-02 09:00:00.000000', 'Denmark', 13);


# Create simple evaluation on orders' amount
select orders.id, orders.amount,
       case
           when orders.amount > 1000 then 'Giant'
           when orders.amount > 300 then 'medium'
           else 'small'
       end as 'Evaluation Result'
from orders;

# Check ship to be Canada or if is null check customers.country
select orders.id, orders.ship_to, customers.id, customers.country
from orders inner join customers on orders.customer_id = customers.id
where 'Canada'=(
    case
        when orders.ship_to is null then customers.country
        else orders.ship_to
    end
);

# Alternative way with IF
select orders.id, orders.ship_to, customers.id, customers.country
from orders inner join customers on orders.customer_id = customers.id
where 'Canada'=(
    IF(orders.ship_to is null, customers.country, orders.ship_to)
);


# get orders with data even if they are null, assume Canada
select ifnull(orders.ship_to, 'Canada') as 'ship to'
from orders;

#alternative way
select coalesce(orders.ship_to, 'Canada') as 'ship to'
from orders;

# get each amount for each order
select orders.amount, ifnull(orders.units, 1) as 'units', orders.amount/ifnull(orders.units, 1) as 'each amount'
from orders;

#alternative way
select orders.amount, coalesce(orders.units, 1) as 'units', orders.amount/coalesce(orders.units, 1) as 'each amount'
from orders;

# check the table before adding the new column
select * from customers;

# Add City column to customers
alter table customers
add City varchar(255) default 'Montréal';

# check the table after adding the new column
select * from customers;

#rename the City column
alter table customers
rename column City to CT;

# check the table after renaming the column
select * from customers;

# Remove CT column
alter table customers
drop column CT;

# check the table after eliminating the column
select * from customers;

# Index on lastname
create index idx_lastname
on customers(last_name);

# Index on combination of last name and first name
create index idx_customer_name
on customers(last_name, first_name);

# Drop the indexes
alter table customers
drop index idx_lastname;

alter table customers
drop index idx_customer_name;

drop table if exists customers, orders;

# create table with some conditions
create table customers(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    password varchar(50),
    country varchar(50),
    balance int,
    age int,
    check (age > 18)
);

insert into customers(first_name, last_name, email, password, country, balance, age) values ('Omid Reza', 'Heidari', 'omid.orh@gmail.com', 'password1', 'Iran', 2000, 12);

drop table if exists customers;
# Alternative way
create table customers(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    password varchar(50),
    country varchar(50),
    balance int,
    age int,
    constraint agecheck check ( age >18 )
);

insert into customers(first_name, last_name, email, password, country, balance, age) values ('Omid Reza', 'Heidari', 'omid.orh@gmail.com', 'password1', 'Iran', 2000, 12);

# drop check constraint
alter table customers
drop constraint agecheck;

insert into customers(first_name, last_name, email, password, country, balance, age) values ('Omid Reza', 'Heidari', 'omid.orh@gmail.com', 'password1', 'Iran', 2000, 12);

# create a view from orders higher price than the average amount
create view OrdersAboveAverageAmount as
select orders.id, orders.amount
from orders
where orders.amount > (select avg(orders.amount) from orders);

select *
from OrdersAboveAverageAmount;

# update the view
create or replace view OrdersAboveAverageAmount as
select orders.id, orders.amount, orders.ship_to
from orders
where orders.amount > (select avg(orders.amount) from orders);

select *
from OrdersAboveAverageAmount;