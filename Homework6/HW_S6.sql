/* Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/

DELIMITER $$
DROP PROCEDURE IF EXISTS convert_to_days$$
CREATE PROCEDURE convert_to_days (IN sec INT)
BEGIN
    SET @days = TRUNCATE(sec / 86400, 0);
    SET @hours = TRUNCATE((sec - @days*86400) / 3600, 0);
    SET @minutes = TRUNCATE(((sec - @days*86400 - @hours*3600) / 60), 0);
    SET @seconds = sec - @days*86400 - @hours*3600 - @minutes*60;
END $$
SET @sec = 678532$$
CALL convert_to_days(@sec)$$
SELECT @hours, @minutes, @seconds$$
SELECT GROUP_CONCAT('Days ', @days, ', hours ', @hours, ', minutes ', @minutes, ', seconds ', @seconds) AS list$$
DELIMITER ;

/*Выведите только четные числа от 1 до 10.
Пример: 2,4,6,8,10
*/
DROP PROCEDURE IF EXISTS even_num_select$$
CREATE PROCEDURE even_num_select (IN num1 INT, num2 INT)
BEGIN
    SET @i = num1;
    SET @result = num1; 
    WHILE @i <= num2-2 DO 
        IF (@i % 2 = 0) THEN
            SET @i = @i+2;
            SET @result = CONCAT(@result , ', ', @i);
        ELSE
            SET @i = @i + 3;
            SET @result = CONCAT(@result+1 , ', ', @i);
        END IF;
    END WHILE;
    SELECT @result;
END $$
SET @num1 = -1$$
SET @num2 = 11$$
CALL even_num_select(@num1, @num2)$$

IF(@i%2=0, SET @result = concat(@i), SET @result = concat(', '));
IF(I%2=0, UPDATE even_number SET even_number = i, UPDATE even_number SET even_number = i-1);
/*Дополнительное:
БД из 4 урока, ВК.
Cоздание процедуры, которая решает следующую задачу
Выбрать для одного пользователя 5 пользователей в случайной комбинации, которые удовлетворяют хотя бы одному критерию:
1) из одного города
2) состоят в одной группе
3) друзья друзей
Cоздание функции, вычисляющей коэффициент популярности пользователя
*/