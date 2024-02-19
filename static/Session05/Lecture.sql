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
    created_at datetime,
    ship_to varchar(50),
    foreign key (customer_id) references customers(id) on delete cascade on update cascade
);


insert into orders(customer_id, amount, created_at, ship_to)
            VALUES (1, 200, '2022-02-02 10:00:00.000000', 'Canada'),
                    (2, 2000, '2024-02-02 19:00:00.000000', 'Finland'),
                    (1, 230, '2024-02-01 01:00:00.000000', 'Italy'),
                    (4, 400, '2021-02-02 13:00:00.000000', 'Norway'),
                    (2, 500, '1999-02-02 22:00:00.000000', 'Iran'),
                    (1, 100, '2002-02-02 09:00:00.000000', 'Denmark');


#GROUP BY Country in customers table
SELECT customers.country, COUNT(customers.id) as "Number of customers"
FROM customers
GROUP BY customers.country;

#GROUP BY Ship to in orders table
SELECT orders.ship_to, COUNT(orders.id) as "Number of orders"
FROM orders
GROUP BY orders.ship_to;

# Customers with more than a single order
SELECT customers.id as "Customer ID", COUNT(orders.id) as "Number of orders"
FROM customers INNER JOIN orders on customers.id = orders.customer_id
GROUP BY orders.customer_id # or customers.id
HAVING COUNT(orders.id) > 1;

# Average amount of order for each of ship to country (first discover then apply condition)
SELECT orders.ship_to as "Ship to (Country)", AVG(orders.amount)
FROM orders
GROUP BY orders.ship_to;

SELECT orders.ship_to as "Ship to (Country)", AVG(orders.amount)
FROM orders
GROUP BY orders.ship_to
HAVING AVG(orders.amount) < 490;

# Customers who has at least an order with amount of X (Fits see all then set condition on the amount)
SELECT customers.*
FROM customers
where EXISTS(
    SELECT orders.id
    FROM orders
    WHERE orders.customer_id=customers.id
);

SELECT customers.*
FROM customers
where EXISTS(
    SELECT orders.id
    FROM orders
    WHERE orders.customer_id=customers.id AND orders.amount > 400
);

#Any | All

# Customers with at least an order with amount of X
SELECT customers.*
FROM customers
WHERE customers.id = ANY (
    SELECT orders.customer_id
    FROM orders
    WHERE amount > 300
);
# Customers with at least an in 2024
SELECT customers.*
FROM customers
WHERE customers.id = ANY (
    SELECT orders.customer_id
    FROM orders
    WHERE YEAR(orders.created_at) = 2024
);
# Customers whose all of their order have been shipped to Z
SELECT customers.*
FROM customers
WHERE customers.id = ALL (
    SELECT orders.customer_id
    FROM orders
    WHERE orders.ship_to='Denmark'
);
# Customer whose orders are at least Y amount
SELECT customers.*
FROM customers
WHERE customers.id = ALL (
    SELECT orders.customer_id
    FROM orders
    WHERE orders.amount
);

create table CustomersBackup(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    password varchar(50),
    country varchar(50),
    balance int
);

# Insert into backup table
INSERT INTO CustomersBackup
SELECT * FROM customers;

SELECT *
FROM CustomersBackup;

# Insert into Iran table
create table CustomersBackupIran(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    password varchar(50),
    country varchar(50),
    balance int
);

INSERT INTO CustomersBackupIran
SELECT * FROM customers
where country='Iran';

SELECT *
FROM CustomersBackupIran;