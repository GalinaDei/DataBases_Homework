-- Используем готовый скрипт для базы данных ВК 4 урока
-- 1.Получите друзей пользователя с id=1
-- (решение задачи с помощью представления “друзья”)
-- 2.Создайте представление, в котором будут выводится все сообщения, в которых принимал
-- участие пользователь с id = 1.
-- 3.Получите список медиафайлов пользователя с количеством лайков(media m, likes l ,users u)
-- 4.Получите количество групп у пользователей
-- 5.Вывести 3 пользователей с наибольшим количеством лайков за медиафайлы
USE lesson_4;
CREATE VIEW user1_friens AS SELECT firstname, lastname 
FROM users JOIN friend_requests ON userS.id = friend_requests.target_user_id 
WHERE friend_requests.initiator_user_id = 1;
SELECT * FROM user1_friens;

CREATE VIEW user1_messages AS SELECT messages.body FROM 
messages WHERE messages.from_user_id = 1  OR messages.to_user_id = 1;
SELECT * FROM user1_messages;

CREATE VIEW how_much_likes AS SELECT users.id, firstname, filename, media_id 
FROM users LEFT JOIN media ON users.id = media.user_id left join likes on media.id = likes.media_id;
SELECT *, COUNT(media_id) OVER(PARTITION BY firstname) AS likes_quantity FROM how_much_likes;

SELECT DISTINCT user_id, COUNT(*) AS community_quantity 
FROM users_communities GROUP by user_id;

SELECT id, firstname, COUNT(media_id) AS likes_quantity 
FROM how_much_likes GROUP BY id ORDER BY likes_quantity DESC LIMIT 3;