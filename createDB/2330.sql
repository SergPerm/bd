create table departments(
	id serial primary key,
	name varchar(255)
);

create table emploers(
	id serial primary key,
	name varchar(255),
	department_id int references departments(id) 
);

insert into departments (name) 
values 	
	('java'),
	('php'),
	('python'),
	('c++'),
	('c#');
	
insert into emploers (name, department_id)
values
		('petr', 1),
		('sasha', 2),
		('serg', 1),
		('denis', null),
		('katya', 3),
		('igor', null),
		('genja', 2),
		('maria', 1);
		
		
--		2. Выполнить запросы с left, rigth, full, cross соединениями

select * from emploers e left join departments d on e.department_id = d.id;

select * from emploers e right join departments d on e.department_id = d.id;

select * from departments d left join emploers e on d.id = e.department_id;

select * from emploers e right join departments d on e.department_id = d.id
union
select * from emploers e left join departments d on e.department_id = d.id;

select * from emploers e full join departments d on e.department_id = d.id;

select e.name, d.name from emploers e cross join departments d;
--select * from emploers e cross join departments d;


--3. Используя left join найти департаменты, у которых нет работников

select * from departments d left join emploers e on d.id = e.department_id where e.department_id is null;


--4. Используя left и right join написать запросы, которые давали бы одинаковый результат. 

select * from emploers e right join departments d on e.department_id = d.id;
select * from departments d left join emploers e on d.id = e.department_id;


--5. Создать таблицу teens с атрибутами name, gender и заполнить ее. 
--Используя cross join составить все возможные разнополые пары

create table teens(
	id serial primary key,
	name varchar(255),
	gender varchar(5)
);
	
insert into teens(name, gender)
values
	('serg', 'm'),
	('maria', 'w'),	
	('sveta', 'w'),
	('petr', 'm'),
	('ksenia', 'w'),
	('rail', 'm'),
	('stas', 'm'),
	('gulchatay', 'w');
	
select t1.name, t2.name, (t1.gender, t2.gender) as "m and w" from teens as t1 
cross join teens as t2 
where 
t1.gender != t2.gender -- все варианты разнополые
; 
	
select t1.name, t2.name, (t1.gender, t2.gender) as "m and w" from teens as t1 
cross join teens as t2 
where 
t1.gender != t2.gender -- все варианты разнополые
and
(t1.gender, t2.gender) != ('w', 'm') --  и только мальчики выбирают
; 

select t1.name, t2.name, (t1.gender, t2.gender) as "m and w" from teens as t1 
cross join teens as t2 
where 
t1.gender != t2.gender -- все варианты разнополые
and
(t1.gender, t2.gender) = ('w', 'm') -- и только девочки выбирают
; 	

