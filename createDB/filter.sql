create table type(
	id serial primary key, 
	name varchar(255)
); 

create table product(
	id serial primary key, 
	name varchar(255), 
	type_id int references type(id), 
	expired_date date, 
	price float
);

 insert into type(id, name)
 	values (1, 'СЫР'), (2, 'МОЛОКО'), (3, 'ХЛЕБ'), 
		   (4, 'МЯСО'), (5, 'РЫБА'), (6, 'МОЛОЧНЫЕ_ПРОДУКТЫ');

 insert into product(id, name, type_id, expired_date, price)
 	values 
	(20, 'мраморная говядина', 4, '2022-02-26', 1550.0),
	(1, 'рокфор', 1, '2021-09-26', 1250.56), (2, 'камамбер', 1, '2021-10-26', 750.6), 
	(3, 'сливочный', 1, '2021-12-26', 250.2), (4, 'нытвенское', 2, '2021-09-30', 50.56), 
	(5, 'ашатли', 2, '2021-09-28', 48.6), (6, 'белый', 3, '2021-10-06', 48.5), 
	(7, 'черный', 3, '2021-10-05', 37.9), (8, 'батон', 3, '2021-11-11', 75.0), 
	(9, 'свинина', 4, '2021-09-20', 125.56), (10, 'говядина', 4, '2021-12-26', 350.94), 
	(11, 'баранина', 4, '2021-09-26', 520.47), (12, 'минтай', 5, '2021-10-15', 125.56), 
	(13, 'форель', 5, '2021-10-18', 650.5), (14, 'лосось', 5, '2021-12-20', 1550.0), 
	(15, 'кефир', 6, '2021-09-24', 25.56), (16, 'сливочное мороженное', 6, '2022-05-26', 139.77), 
	(17, 'сметана', 6, '2021-09-22', 95.15), (18, 'йогурт', 6, '2021-10-26', 66.51),
	(19, 'молочное мороженное', 6, '2022-02-26', 39.77);


	
--1. Написать запрос получение всех продуктов с типом "СЫР"

select p.name, t.name from product as p join type as t on p.type_id = t.id where t.name = 'СЫР';

--2. Написать запрос получения всех продуктов, у кого в имени есть слово "мороженое"
select p.name, t.name from product as p join type as t on p.type_id = t.id where p.name like '%мороженное';
-- или
select p.name from product as p where p.name like '%мороженное';

--3. Написать запрос, который выводит все продукты, срок годности которых уже истек

select p.name, p.expired_date from product as p where p.expired_date < current_date;

--4. Написать запрос, который выводит самый дорогой продукт.

select p.name, p.price from product as p where p.price = (select max(price)from product);

--5. Написать запрос, который выводит для каждого типа количество продуктов к нему принадлежащих. 
--В виде имя_типа, количество


select t.name, count(*) 
from product as p join type as t on p.type_id = t.id 
group by t.name 
order by count desc;

--6. Написать запрос получение всех продуктов с типом "СЫР" и "МОЛОКО"


select t.name, p.name 
from product as p join type as t on p.type_id = t.id where t.name = 'СЫР' or t.name = 'МОЛОКО'
order by t.name desc, p.name asc;

--7. Написать запрос, который выводит тип продуктов, которых осталось меньше 10 штук. Под количеством 
--подразумевается количество продуктов определенного типа. Например, если есть тип "СЫР" и продукты 
--"Сыр плавленный" и "Сыр моцарелла", которые ему принадлежат, то количество продуктов типа "СЫР" будет 2. 

select foo.name, foo.count 
from (select t.name as name, count(*) 
	  from product as p join type as t on p.type_id = t.id 
	  group by t.name) as foo
where count < 4
order by count desc;

--8. Вывести все продукты и их тип.

select p.name, t.name 
from product as p join type as t on p.type_id = t.id 
order by t.name desc, p.name asc;
