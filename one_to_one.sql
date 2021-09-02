create table inn(
    id serial primary key,
    number int8
);

create table people(
    id serial primary key,
    name varchar(255),
    inn_id int references inn(id) unique
);

insert into inn(number) values(59125478896);
insert into people(name, inn_id) values ('serg', 1);

insert into inn(number) values(59125478897);
insert into people(name, inn_id) values ('serg2', 2);
insert into people(name, inn_id) values ('serg3', 2);

select * from people;

select * from inn;

alter sequence inn_id_seq restart with 1;
alter sequence people_id_seq restart with 1;

delete from inn;
delete from people;