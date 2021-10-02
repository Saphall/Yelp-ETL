CREATE TABLE IF NOT EXISTS raw_business (
    business_id VARCHAR(500),
    name VARCHAR(500),
    address VARCHAR(500),
    city VARCHAR(500),
    state VARCHAR(500),
    postal_code VARCHAR(500),
    latitude VARCHAR(500),
    longitude VARCHAR(500),
    stars VARCHAR(500),
    review_count VARCHAR(500),
    is_open VARCHAR(500),
    attributes TEXT,
    categories TEXT,
    hours TEXT
);