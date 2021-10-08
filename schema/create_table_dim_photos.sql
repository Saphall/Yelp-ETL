create table if not exists dim_photos(
	photo_id VARCHAR(22) not null ,
	business_id VARCHAR(22) not null,
	caption text,
	label VARCHAR (255),	
	constraint fk_photos_dim_business_id
	foreign KEY(business_id) references fact_business(business_id)
);