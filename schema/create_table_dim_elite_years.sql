create table if not exists dim_elite_years(
	user_id VARCHAR(255) not null,
	elite_year VARCHAR(4),
	constraint fk_elite_user_id
	foreign key(user_id) references fact_user(user_id),
	primary KEY( user_id,elite_year)
);