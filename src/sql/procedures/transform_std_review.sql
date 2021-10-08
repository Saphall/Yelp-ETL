CREATE OR REPLACE PROCEDURE transform_std_review()
LANGUAGE plpgsql
AS $$
BEGIN
  TRUNCATE TABLE std_review CASCADE;
INSERT INTO std_review
SELECT 
   review_id,
   user_id,
   business_id,
   CAST(CAST (stars AS FLOAT) AS INT),
   CAST (date AS DATE),
   text,
   CAST (useful AS INT),
   CAST (funny AS INT),
   CAST (cool AS INT)
FROM raw_review;
END;$$;

CALL transform_std_review();