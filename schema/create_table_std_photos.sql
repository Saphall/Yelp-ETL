create table if not exists std_photos(
	photo_id VARCHAR(22) not null ,
	business_id VARCHAR(22) not null,
	caption text,
	label VARCHAR (255),	
	constraint fk_photos_std_business_id
	foreign key(business_id) references std_business(business_id)
);