CREATE TABLE IF NOT EXISTS std_review (
  review_id VARCHAR(22) PRIMARY KEY, 
  user_id VARCHAR(22) NOT NULL, 
  business_id VARCHAR(22) NOT NULL, 
  stars INT NOT NULL, 
  date timestamp NOT NULL, 
  text TEXT NOT NULL, 
  useful INT NOT NULL, 
  funny INT NOT NULL, 
  cool INT NOT NULL,
  CONSTRAINT fk_review_std_user_id
    FOREIGN KEY (user_id) 
    REFERENCES std_user(user_id),
  CONSTRAINT fk_review_std_business_id
    FOREIGN KEY (business_id) 
    REFERENCES std_business(business_id)
);