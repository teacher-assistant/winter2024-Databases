USE comp353lab;

drop table if exists orders;
drop table if exists customers;

create table customers(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    password varchar(50),
    country varchar(50),
    balance int
);

insert into customers(first_name, last_name, email, password, country, balance) values ('Omid Reza', 'Heidari', 'omid.orh@gmail.com', 'password1', 'Iran', 2000);
insert into customers(first_name, last_name, email, password, country, balance) values ('Ali', 'Amiri', 'ali@gmail.com', 'password2', 'Canada', 3000);
insert into customers(first_name, last_name, email, password, country, balance) values ('John', 'Nash', 'nash@gmail.com', 'password3', 'Denmark', 1400);
insert into customers(first_name, last_name, email, password, country, balance) values ('Pari', 'Amin', 'pr.am@gmail.com', 'password4', 'Iran', 4200);
insert into customers(first_name, last_name, email, password, country, balance) values ('David', 'Ahmad', 'dmp.mmd@gmail.com', 'password5', 'Canada', 300);

create table orders(
    id int primary key auto_increment,
    customer_id int,
    amount int,
    created_at datetime,
    foreign key (customer_id) references customers(id) on delete cascade on update cascade
);

insert into orders(customer_id, amount, created_at) VALUES (1, 200, '2022-02-02 10:00:00.000000');
insert into orders(customer_id, amount, created_at) VALUES (2, 2000, '2024-02-02 19:00:00.000000');
insert into orders(customer_id, amount, created_at) VALUES (1, 230, '2024-02-01 01:00:00.000000');
insert into orders(customer_id, amount, created_at) VALUES (4, 400, '2021-02-02 13:00:00.000000');
insert into orders(customer_id, amount, created_at) VALUES (2, 500, '1999-02-02 22:00:00.000000');
insert into orders(customer_id, amount, created_at) VALUES (1, 100, '2002-02-02 09:00:00.000000');

#Foreign key
delete from customers where id=1;

select * from customers;
select * from orders;

# where conditions
select *
from customers
where balance > 2000 and country='Iran';

select *
from customers
where country !='Iran';

select *
from customers
where country <>'Iran';

select *
from customers
where country='Canada' or balance < 1500;

# Full join
select *
from customers join orders;

# Inner join
select customers.id, orders.id
from customers inner join orders on customers.id = orders.customer_id;

# right join (all orders by any customer) (no sense!)
select customers.id, orders.id
from customers right join orders on customers.id = orders.customer_id;

# left join (all customers with any order)
select customers.id, orders.id
from customers left join orders on customers.id = orders.customer_id;

# self join
select A.id, B.id, B.country as 'Country'
from customers A, customers B
where A.id <> B.id and A.country = B.country;

# Null
insert into customers(first_name, last_name, email, password, country) values ('Samin', 'Mahnazi', 'sa.mmd@gmail.com', 'password5', 'Canada');

select customers.id, customers.balance
from customers
where balance is null;

select customers.id, customers.balance
from customers
where balance is not null;

# order by
select customers.id, customers.balance
from customers
order by balance;

select customers.id, customers.balance
from customers
order by balance desc;

# not required
select customers.id, customers.balance
from customers
order by balance asc;