CREATE DATABASE IF NOT EXISTS mobile_phones;
USE mobile_phones;
CREATE TABLE IF NOT EXISTS phones
(
	id int PRIMARY KEY auto_increment,
    ProductName VARCHAR (45),
    Manufacturer VARCHAR (45),
    ProductCount int,
    Price int
);
INSERT phones (ProductName, Manufacturer, ProductCount, price)
VALUES
	('iPhone X', 'Apple', 3, 76000),
    ('iPhone 8', 'Apple', 2, 51000),
    ('Galaxy S9', 'Samsung', 2, 56000),
    ('Galaxy S8', 'Samsung', 1, 41000),
    ('P20 Pro', 'Huawei', 5, 36000);
SELECT * FROM phones;
SELECT ProductName, Manufacturer, Price FROM phones WHERE ProductCount > 2;
SELECT ProductName FROM phones WHERE Manufacturer = 'Samsung';
SELECT ProductName, Manufacturer, ProductCount, Price FROM phones 
WHERE ProductCount * Price > 100000 AND ProductCount * Price < 145000;

SELECT * FROM phones WHERE ProductName LIKE '%iPhone%';
SELECT * FROM phones WHERE ProductName LIKE '%Galaxy%';
SELECT * FROM phones WHERE ProductName RLIKE '[8]';


