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



# Assignment
drop table if exists actors, directors, movies, casts;

CREATE TABLE actors (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  gender CHAR(1)
);

CREATE TABLE directors (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE movies (
  id INT PRIMARY KEY,
  title VARCHAR(50),
  year INT,
  runtime INT,
  director_id INT,
  FOREIGN KEY (director_id) REFERENCES directors(id)
);

CREATE TABLE casts (
  actor_id INT,
  movie_id INT,
  FOREIGN KEY (actor_id) REFERENCES actors(id),
  FOREIGN KEY (movie_id) REFERENCES movies(id)
);

INSERT INTO actors (id, name, gender) VALUES
(1, 'Orson Welles', 'M'),
(2, 'James Stewart', 'M'),
(3, 'Kim Novak', 'F'),
(4, 'Marlon Brando', 'M'),
(5, 'Al Pacino', 'M'),
(6, 'Janet Gaynor', 'F'),
(7, 'Toshiro Mifune', 'M'),
(8, 'Takashi Shimura', 'M'),
(9, 'Robert De Niro', 'M'),
(10, 'Jodie Foster', 'F'),
(11, 'Bibi Andersson', 'F'),
(12, 'Liv Ullmann', 'F'),
(13, 'Marylin Monroe', 'F'),
(14, 'Jack Lemmon', 'M'),
(15, 'Humphrey Bogart', 'M'),
(16, 'Ingrid Bergman', 'F'),
(17, 'Clark Gable', 'M'),
(18, 'Vivien Leigh', 'F'),
(19, 'Leonardo Di Caprio', 'M'),
(20, 'Kate Winslet', 'F');


INSERT INTO directors (id, name) VALUES
(1, 'Orson Welles'),
(2, 'Alfred Hitchcock'),
(3, 'Francis Ford Coppola'),
(4, 'F.W. Murnau'),
(5, 'Akira Kurusawa'),
(6, 'Vittorio De Sica'),
(7, 'Martin Scorsese'),
(8, 'Ingmar Bergman'),
(9, 'Billy Wilder'),
(10, 'Michael Curtiz'),
(11, 'James Cameron'),
(12, 'Victor Fleming');


INSERT INTO movies (id, title, year, runtime, director_id) VALUES
(1, 'Citizen Kane', 1941, 119, 1),
(2, 'Vertigo', 1958, 128, 2),
(3, 'The Godfather', 1972, 175, 3),
(4, 'Sunrise', 1927, 94, 4),
(5, 'The Seven Samurai', 1954, 207, 5),
(6, 'Bicycle Thieves', 1948, 89, 6),
(7, 'Taxi Driver', 1976, 114, 7),
(8, 'Persona', 1966, 83, 8),
(9, 'Some Like it Hot', 1959, 121, 9),
(10, 'Casablanca', 1942, 102, 10),
(11, 'Sunset Boulevard', 1950, 110, 9),
(12, 'Titanic', 1997, 195, 11),
(13, 'Gone With the Wind', 1939, 221, 12);


INSERT INTO casts (actor_id, movie_id) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 5),
(8, 5),
(9, 7),
(10, 7),
(11, 8),
(12, 8),
(13, 9),
(14, 9),
(15, 10),
(16, 10),
(19, 12),
(20, 12),
(17, 13),
(18, 13);

# Query 1

# Query 2

# Query 3

# Query 4

# Query 5

# Query 6

# Query 7

# Query 8

# Query 9

# Query 10

# Query 11

# Query 12