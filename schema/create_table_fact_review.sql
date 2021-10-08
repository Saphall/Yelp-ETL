CREATE TABLE IF NOT EXISTS fact_review (
  review_id VARCHAR(22), 
  user_id VARCHAR(22), 
  business_id VARCHAR(22), 
  stars INT NOT NULL, 
  date DATE NOT NdULL, 
  text TEXT NOT NULL, 
  useful INT NOT NULL, 
  funny INT NOT NULL, 
  cool INT NOT NULL,
  CONSTRAINT fk_review_user_user_id
    FOREIGN KEY (user_id) 
    REFERENCES fact_user(user_id),
  CONSTRAINT fk_review_business_business_id
    FOREIGN KEY (business_id) 
    REFERENCES fact_business(business_id)
);