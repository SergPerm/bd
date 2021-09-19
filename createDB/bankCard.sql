create table card(
	id serial primary key,
	number int8,
	cvs int
);

create table people(
	id serial primary key,
	name varchar(255),
	card_id int references card(id) unique
);

insert into card (id, number, cvs) 
values 
(1, 2201568715648937, 156),
(2, 1648315797313874, 486),
(3, 1548731897154864, 753),
(4, 6487317753148634, 684),
(5, 6879149678529436, 584);

insert into people (id, name, card_id) 
values
(1, 'petr', 1),
(2, 'stas', 2),
(3, 'serg', 3),
(4, 'rail', 4);
insert into people (id, name) values (5, 'elena');

select p.name, c.number from people as p join card as c on p.card_id=c.id;

select p.name as Имя, c.number as Номер_карты from people as p join card as c on p.card_id=c.id;

select c.number as Numb, p.name as Имя from card as c join people as p on c.id = p.card_id;