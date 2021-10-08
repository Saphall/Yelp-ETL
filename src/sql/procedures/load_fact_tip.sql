CREATE OR REPLACE PROCEDURE load_fact_tip()
LANGUAGE plpgsql
AS $$
BEGIN
TRUNCATE TABLE fact_tip CASCADE;  
  INSERT INTO fact_tip (user_id, business_id, text, date, compliment_count)
  SELECT
  user_id, 
  business_id, 
  text, 
  date, 
  compliment_count
  FROM std_tip;
 END;$$;

call load_fact_tip();