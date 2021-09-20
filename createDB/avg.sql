create table devices(
    id serial primary key,
    name varchar(255),
    price float
);

create table people(
    id serial primary key,
    name varchar(255)
);

create table devices_people(
    id serial primary key,
    device_id int references devices(id),
    people_id int references people(id)
);

insert into devices (name, price) 
values
('iPhone', 76000),
('MacBook', 121000),
('Apple AirPods', 11000),
('Sumsung Galaxy', 46000),
('Sumsung TV',  24000),
('HTC Desire', 4800),
('Nokia 3310', 3800);

insert into people (id, name) 
values (1, 'petr'), (2, 'stas'), (3, 'serg'), (4, 'rail'), (5, 'elena');

insert into devices_people (device_id, people_id)
values (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (2, 4), 
(3, 2), (3, 4), (3, 5), (4, 4), (4, 5), (5, 1), (5, 2), 
(5, 4), (6, 3), (6, 5), (7, 2), (7, 3), (7, 4), (7, 1);

select avg(price) from devices;

select p.name, avg(d.price) from devices_people as dp 
join people as p on dp.people_id = p.id
join devices as d on dp.device_id = d.id
group by p.name
order by avg(d.price);

select p.name, avg(d.price) from devices_people as dp 
join people as p on dp.people_id = p.id
join devices as d on dp.device_id = d.id
group by p.name
having avg(d.price) > 5000;

select p.name, d.name, d.price from devices_people as dp 
join people as p on dp.people_id = p.id
join devices as d on dp.device_id = d.id
order by p.name;
