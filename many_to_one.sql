create table wheelSize(
    id serial primary key,
    dimension varchar(255)
);

create table wheels(
    id serial primary key,
    name varchar(255),
    wheelSize_id int references wheelSize(id)
);

insert into wheelSize(dimension) values ('235/65 R16');
insert into wheels(name, wheelSize_id) VALUES ('Nokian', 1);

select * from wheels;

select * from wheelSize where id in (select id from wheels);