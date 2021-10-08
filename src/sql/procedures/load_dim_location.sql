CREATE OR REPLACE PROCEDURE load_dim_location()
LANGUAGE plpgsql
AS $$
BEGIN
truncate table dim_location CASCADE;
 INSERT INTO dim_location (city, state)
  SELECT 
  distinct city, state  
  FROM std_business; 
END;$$;

call load_dim_location();
