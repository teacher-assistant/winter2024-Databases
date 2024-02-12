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

# Eliminate all of the customer with lower balance than 1500
delete from customers
where customers.balance<1500;


# Update all of the Customers with country of Denmark to Turkey
update customers
set customers.country = 'Turkey'
where customers.country = 'Denmark';

# See all of the customers
select customers.id, customers.country
from customers;

# Fetch all of the order with id of 1, 3, or 6
select orders.id, orders.amount, orders.ship_to
from orders
where id in (1, 3, 6);

# Alternative way to implement the above command
select *
from orders
where id=1 or id=3 or id=6;

# Fetch all of the countries (orders and customers tables)
select customers.country
from customers
union
select orders.ship_to
from orders;

# Fetch all of the order with amount in range of 350 and 550
select orders.id, orders.amount
from orders
where amount between 350 and 550;


# Like command (with wildcard)
select customers.id, customers.first_name, customers.last_name ,customers.country
from customers
where country like '%da';

select customers.id, customers.first_name, customers.last_name ,customers.country
from customers
where country like 'Ir%';

select customers.id, customers.first_name, customers.last_name ,customers.country
from customers
where country like 'Ir_n';

# Like command (without wildcard)
select customers.id, customers.first_name, customers.last_name ,customers.country
from customers
where country like 'Canada';

# See all of the customers
select customers.id, customers.country, customers.first_name, customers.last_name
from customers;

# Set limit
select customers.id, customers.country, customers.first_name, customers.last_name
from customers
limit 2;

# Set Limit with offset
select customers.id, customers.country, customers.first_name, customers.last_name
from customers
limit 2
offset 1;
