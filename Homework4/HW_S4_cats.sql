/*Используем готовый скрипт для создания таблиц.
Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
*/
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);

SELECT cats.id, cats.name, shops.shopname    --Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
FROM cats LEFT JOIN shops ON cats.shops_id = shops.id; 
SELECT shops.shopname, cats.name FROM shops, cats WHERE shops.id = cats.shops_id AND cats.name = "Murzik"; -- Вывести магазин, в котором продается кот “Мурзик”
SELECT shops.shopname FROM cats JOIN shops ON shops.id = cats.shops_id WHERE cats.name = "Murzik"; -- второй способ
SELECT shops.shopname FROM shops WHERE shops.shopname NOT IN -- Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
(SELECT shops.shopname FROM cats JOIN shops ON shops.id = cats.shops_id WHERE cats.name = "Murzik" OR cats.name = "Zuza"); 
