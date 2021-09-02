 create table cars(
     id serial primary key,
     name varchar(255)
 );
 
 create table wheels1(
     id serial primary key,
     name varchar(255)
 );
 
 create table cars_wheels(
     id serial primary key,
     cars_id int references cars(id),
     wheels_id int references wheels1(id)
 );
 
 insert into cars(name) values ('Toyota'); 
 insert into cars(name) values ('Mazda');
 insert into cars(name) values ('BMV');
 
 insert into wheels1(name) values ('Pirelli'); 
 insert into wheels1(name) values ('Toyo'); 
 insert into wheels1(name) values ('Nokian');

insert into cars_wheels(cars_id, wheels_id) values (1, 1);
insert into cars_wheels(cars_id, wheels_id) values (1, 2);
insert into cars_wheels(cars_id, wheels_id) values (1, 3);
insert into cars_wheels(cars_id, wheels_id) values (2, 1);
insert into cars_wheels(cars_id, wheels_id) values (2, 2);
insert into cars_wheels(cars_id, wheels_id) values (3, 3);
insert into cars_wheels(cars_id, wheels_id) values (3, 1);

select * from cars_wheels;