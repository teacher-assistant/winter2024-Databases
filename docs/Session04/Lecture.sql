use comp353lab;

drop table if exists customers, orders;

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

delete from customers
where customers.balance<1500;


update customers
set customers.country = 'Turkey'
where customers.country = 'Denmark';

select *
from customers;

select *
from orders
where id in (1, 3, 6);

select *
from orders
where id=1 or id=3 or id=6;

select customers.country
from customers
union
select orders.ship_to
from orders;

select orders.amount
from orders
where amount between 350 and 550;


select *
from customers;

select *
from customers
limit 2;

select *
from customers
limit 2
offset 1;

