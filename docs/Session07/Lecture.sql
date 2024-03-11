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
    balance int,
    last_huge_order_data datetime
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


DROP PROCEDURE IF EXISTS create_order_transaction;

# Update balance of customer after creating of the order
CREATE PROCEDURE create_order_transaction()
BEGIN
SET @customerId = 2;
SET @orderCost = 2501;
SELECT balance INTO @customerBalance FROM customers WHERE id = @customerId;

IF @customerBalance > @orderCost THEN
    UPDATE customers
    SET balance = balance - @orderCost
    WHERE id = @customerId;

    INSERT INTO orders (customer_id, amount, created_at, ship_to, units) VALUES (@customerId, @orderCost, '2022-02-02 10:00:00.000000', 'Iran', 1);
    COMMIT;
ELSE
    ROLLBACK;
END IF;
END;

CALL create_order_transaction();

SELECT *
FROM customers;

# update last huge order data (if it is not huge roll back to the checkpoint)
DROP PROCEDURE IF EXISTS create_order_with_update_large_order_transaction;

CREATE PROCEDURE create_order_with_update_large_order_transaction()
BEGIN
start transaction;
SET @customerId = 1;
SET @orderCost = 999;
SELECT balance INTO @customerBalance FROM customers WHERE id = @customerId;

IF @customerBalance > @orderCost THEN
    UPDATE customers
    SET balance = balance - @orderCost
    WHERE id = @customerId;

    INSERT INTO orders (customer_id, amount, created_at, ship_to, units) VALUES (@customerId, @orderCost, '2022-02-02 10:00:00.000000', 'Iran', 1);
    SAVEPOINT before_data_update;


    IF @orderCost > 1000 THEN
        UPDATE customers
        SET last_huge_order_data = '2022-02-02 10:00:00.000000'
        where id=@customerId;
    ELSE
        ROLLBACK TO SAVEPOINT before_data_update;
    END IF;
    COMMIT;
ELSE
    ROLLBACK;
END IF;
END;

CALL create_order_with_update_large_order_transaction();

SELECT *
FROM customers;