CREATE OR REPLACE PROCEDURE load_fact_user()
LANGUAGE plpgsql
AS $$
BEGIN
truncate table fact_user cascade;
 INSERT INTO fact_user
  SELECT
   user_id , 
  name , 
  review_count, 
  yelping_since ,
  friends,
  friends_count ,  
  useful , 
  funny , 
  cool, 
  fans , 
  elite_count,
  average_stars ,
  compliment_hot,
  compliment_more ,
  compliment_profile ,
  compliment_cute ,
  compliment_list ,
  comliment_note ,
  compliment_plain ,
  compliment_cool ,
  compliment_funny ,
  compliment_writer ,
  compliment_photos 
  FROM std_user; 
 END;$$;

call load_fact_user();