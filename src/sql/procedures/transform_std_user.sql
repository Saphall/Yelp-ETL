CREATE OR REPLACE PROCEDURE transform_std_user()
LANGUAGE plpgsql
AS $$
BEGIN
  TRUNCATE TABLE std_user CASCADE;
  INSERT INTO std_user
  SELECT 
  user_id,
  name,
  CAST (review_count AS INT),
  CAST (yelping_since AS DATE),
  string_to_array(friends, ','),
  CASE WHEN friends = '' THEN 0
    ELSE array_length(string_to_array(friends, ','), 1) END,
  CAST (useful AS INT),
  CAST (funny AS INT),
  CAST (cool AS INT),
  CAST (fans AS INT),
  string_to_array(elite, ','),
  CASE WHEN elite = '' THEN 0
  	ELSE array_length(string_to_array(elite, ','), 1) END, 
  CAST(average_stars AS FLOAT),
  CAST( compliment_hot as INT),
  CAST(	compliment_more as INT),
  CAST(	compliment_profile as INT),
  CAST(compliment_cute AS INT),
  CAST(	compliment_list AS INT),
  CAST(comliment_note AS INT),
  CAST(compliment_plain AS INT),
  CAST(compliment_cool AS INT),
  CAST(compliment_funny AS INT),
  CAST(compliment_writer AS INT),
  CAST(compliment_photos AS INT)
  FROM raw_user;
END;$$;

CALL transform_std_user();