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

# How to retrieve some information from users?

# First lets insert some data to it
insert into users(first_name, last_name, email, password, country) values ("Omid Reza", "Heidari", "omid.orh@gmail.com", "123", "Iran");
insert into users(first_name, last_name, email, password, country) values ("Ali", "Amiri", "ali@gmail.com", "123", "Canada");
insert into users(first_name, last_name, email, password, country) values ("John", "Nash", "nash@gmail.com", "123", "Denmark");
insert into users(first_name, last_name, email, password, country) values ("Pari", "Amin", "pr.am@gmail.com", "123", "Iran");

# Now, lets select some information
select users.first_name, users.last_name from users;

# Select All of the rows
select * from users;

# Custom names for the columns in the output
select users.first_name as `First Name` from users;

# Unique values?
select users.country from users;
select distinct users.country from users;

