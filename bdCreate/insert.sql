INSERT INTO public.role(
	name, description)
	VALUES ('admin', 'he can do all');
	
INSERT INTO public.rules(
	name, description)
	VALUES ('edit', 'correct DB');
	
INSERT INTO public.role_rules(
	name, role_id, rules_id)
	VALUES ('admin edit', 1, 1);
	
INSERT INTO public.category(
	name)
	VALUES ('other');
	
INSERT INTO public.state(
	name)
	VALUES ('new');
	
INSERT INTO public.users(
	first_name, last_name, age, role_id)
	VALUES ('serg', 'mokhin', 45, 1);
	
INSERT INTO public.item(
	name, users_id, state_id, category_id)
	VALUES ('first', 1, 1, 1);
	
INSERT INTO public.attachs(
	name, item_id)
	VALUES ('price', 1);
	
INSERT INTO public.comments(
	comment, item_id)
	VALUES ('no comments', 1);
