CREATE OR REPLACE PROCEDURE load_fact_checkin()
LANGUAGE plpgsql
AS $$
BEGIN
TRUNCATE TABLE fact_checkin CASCADE;  
  INSERT INTO fact_checkin (business_id, date)  
  SELECT 
  business_id, 
  date
  FROM std_checkin;  
 END;$$;

call load_fact_checkin();