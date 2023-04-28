/*
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE 
*/
CREATE DATABASE homework2;
USE homework2;
CREATE TABLE sales 
(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    oder_date DATE, 
    count_product INT
    );
INSERT sales (oder_date, count_product)
VALUES
    ('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
SELECT id, oder_date, count_product,
CASE TRUE
    WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product >= 100 AND count_product <= 300 THEN 'Средний заказ'
    ELSE 'Большой заказ'
END AS Тип_заказа
FROM sales;

CREATE TABLE orders
(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    employee_id VARCHAR (10) NOT NULL, 
    amount DECIMAL(10,2) NOT NULL,
    order_status VARCHAR (15)
    );
INSERT orders (employee_id, amount, order_status)
VALUES
    ('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
SELECT id, order_status,
    CASE order_status
         WHEN "OPEN" THEN 'Order is in open state'
         WHEN "CANCELLED" THEN 'Order is cancelled'
         WHEN "CLOSED" THEN 'Order is closed'
    END AS Full_order_status
    FROM orders;