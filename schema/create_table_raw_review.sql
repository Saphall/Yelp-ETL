CREATE TABLE IF NOT EXISTS raw_review(
	review_id VARCHAR(500),
	user_id VARCHAR(500),
	business_id VARCHAR(500),
	stars VARCHAR(500),
	useful VARCHAR(500),
	funny VARCHAR(500),
	cool VARCHAR(500),
	text TEXT,
	date VARCHAR(500)	
);