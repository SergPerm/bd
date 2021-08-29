create table cats(
	id serial primary key,
	name varchar(255),
	weight integer,
	isNatural boolean,
	area text
);
insert into cats (name, weight, isNatural, area) values ('tiger', 300, true, 'tayga, jungli');
insert into cats (name, weight, isNatural, area) values ('home cat', 3, false, 'allways');
insert into cats (name, weight, isNatural, area) values ('puma', 200, true, 'preria');

select * from cats;
 
update cats set name = 'leon';

delete from cats;

