CREATE OR REPLACE PROCEDURE transform_std_tip()
LANGUAGE plpgsql
AS $$
begin
TRUNCATE TABLE std_tip CASCADE;
INSERT INTO std_tip (user_id, business_id, text, date, compliment_count)
 SELECT 
 user_id,
 business_id,
 text,
 CAST (date AS DATE),
 CAST (complement_count AS INT)
 FROM raw_tip;
END;$$;

CALL transform_std_tip();