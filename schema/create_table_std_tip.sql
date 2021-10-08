CREATE TABLE IF NOT EXISTS std_tip (
  tip_id SERIAL PRIMARY KEY,
  user_id VARCHAR(22) NOT NULL, 
  business_id VARCHAR(22) NOT NULL, 
  text TEXT NOT NULL, 
  date DATE NOT NULL, 
  compliment_count INT NOT NULL,
  CONSTRAINT fk_tip_std_user_id
    FOREIGN KEY (user_id) 
    REFERENCES std_user(user_id),
  CONSTRAINT fk_tip_std_business_id
    FOREIGN KEY (business_id) 
    REFERENCES std_business(business_id)
);