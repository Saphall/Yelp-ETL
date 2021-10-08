CREATE TABLE IF NOT EXISTS fact_tip (
  tip_id SERIAL PRIMARY KEY,
  user_id VARCHAR(22) NOT NULL, 
  business_id VARCHAR(22) NOT NULL, 
  text TEXT NOT NULL, 
  date DATE NOT NULL, 
  compliment_count INT NOT NULL,
  CONSTRAINT fk_user_fact_tip_user_id
    FOREIGN KEY (user_id) 
    REFERENCES fact_user(user_id),
  CONSTRAINT fk_business_fact_tip_business_id
    FOREIGN KEY (business_id) 
    REFERENCES fact_business(business_id)
);