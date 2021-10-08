CREATE TABLE IF NOT EXISTS fact_checkin (
  checkin_id SERIAL PRIMARY KEY,
  business_id VARCHAR(22) NOT NULL, 
  date TIMESTAMP NOT NULL,
  CONSTRAINT fk_checkin_business_id
    FOREIGN KEY (business_id) 
    REFERENCES fact_business(business_id) 
);