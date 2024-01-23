# How to retrieve databases list?
show databases;

# How to create a new database?
create database comp353lab;

# How to delete a specific database?
drop database comp353lab;

# How to select a database to run queries on it?
use comp353lab;

# How to create a table?
create table users(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    password varchar(50),
    country varchar(50)
);

# How to drop the table?
drop table users;

# How to insert some data to our table?
insert into users(first_name, last_name, email, password, country) values ('Omid Reza', 'Heidari', 'omid.orh@gmail.com', 'password1', 'Iran');
insert into users(first_name, last_name, email, password, country) values ('Ali', 'Amiri', 'ali@gmail.com', 'password2', 'Canada');
insert into users(first_name, last_name, email, password, country) values ('John', 'Nash', 'nash@gmail.com', 'password3', 'Denmark');
insert into users(first_name, last_name, email, password, country) values ('Pari', 'Amin', 'pr.am@gmail.com', 'password4', 'Iran');
insert into users(first_name, last_name, email, password, country) values ('David', 'Ahmad', 'dmp.mmd@gmail.com', 'password5', 'Canada');

# How to retrieve some information from users?
select * from users;