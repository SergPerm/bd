create table carcasses(
id serial primary key,
name varchar(255)
);

create table engines(
id serial primary key,
name varchar(255)
);

create table gearboxes(
id serial primary key,
name varchar(255)
);

create table cars(
id serial primary key,
name varchar(255),
carcass_id int references carcasses(id),
engine_id int references engines(id),
gearbox_id int references gearboxes(id)
);

insert into carcasses (name)
values ('sedan'), ('cabrio'), ('van'), ('combi'), ('pickup');

insert into engines (name)
values ('gasoline 1.5l'), ('gasoline 2l'), ('gasoline 3l'), 
('diesel 2.2l'), ('diesel 4.5l'), ('electro'), ('metan');

insert into gearboxes (name)
values ('mechanic 5'), ('mechanic 6'), ('automat 5'), ('variator'), ('robot 4');

insert into cars (name, carcass_id, engine_id, gearbox_id)
values ('camry', 1, 3, 3), ('hilux', 5, 5, 2), ('estima', 3, 3, 3), 
('leaf', 4, 6, 4), ('corolla', 1, 1, 1), ('serena', 3, 6, 4);

select c.name "mark", cc.name "carcass", e.name "engine", gb.name "gearbox" from cars as c 
join carcasses as cc on c.carcass_id = cc.id
join engines as e on c.engine_id = e.id
join gearboxes as gb on c.gearbox_id = gb.id;

select cc.name from carcasses cc left join cars c on cc.id = c.carcass_id where c.carcass_id is null; 

select e.name from engines e left join cars c on e.id = c.engine_id where c.engine_id is null; 

select gb.name from gearboxes gb left join cars c on gb.id = c.gearbox_id where c.gearbox_id is null; 
