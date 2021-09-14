create table users (
    id serial primary key,
	first_name varchar(100),
	last_name varchar(100),
	age int,
	role_id int references role(id)
);

create table role (
    id serial primary key,
    name varchar(100),
	description text
);

create table rule(
    id serial primary key,
    name varchar(100),
	description text
);

create table item(
    id serial primary key,
    name varchar(255),	
    users_id int references users(id),
    state_id int references state(id),
	category_id int references category(id)
);

create table comments (
    id serial primary key,
    comment text,	
    item_id int references item(id)
);

create table attachs (
    id serial primary key,
    name varchar(255),	
    item_id int references item(id)
);

create table category (
    id serial primary key,
    name varchar(255)
);

create table state (
    id serial primary key,
    name varchar(100)	
);

create table role_rules (
    id serial primary key,
    name varchar(255),	
    role_id int references role(id),
    rules_id int references rules(id),
	unique(role_id, rules_id)
);