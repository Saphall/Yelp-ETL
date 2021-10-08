CREATE OR REPLACE PROCEDURE transform_std_checkin()
LANGUAGE plpgsql
AS $$
BEGIN
  TRUNCATE TABLE std_checkin CASCADE;  
  INSERT INTO std_checkin (business_id, date)  
  SELECT business_id, cast(dates as timestamp) 
  FROM raw_checkin
  CROSS JOIN UNNEST(string_to_array(date, ',')) AS dates;
END;$$;

CALL transform_std_checkin();