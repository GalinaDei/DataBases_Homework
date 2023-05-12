/*Дополнительное:
БД из 4 урока, ВК.
Cоздание процедуры, которая решает следующую задачу
Выбрать для одного пользователя 5 пользователей в случайной комбинации, которые удовлетворяют хотя бы одному критерию:
1) из одного города
2) состоят в одной группе
3) друзья друзей
Cоздание функции, вычисляющей коэффициент популярности пользователя
*/
USE lesson_4;
SELECT users.id, users.firstname, profiles.hometown 
FROM users JOIN profiles ON users.id = profiles.user_id 
WHERE profiles.hometown = 'Adriannaport' ORDER BY rand()LIMIT 5; -- выбираем случайно по городу