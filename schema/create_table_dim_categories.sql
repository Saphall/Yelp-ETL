create table if not exists dim_categories(
	category_id SERIAL primary key,
	category_name varchar(255) not null
);