CREATE OR REPLACE PROCEDURE load_fact_review()
LANGUAGE plpgsql
AS $$
BEGIN
 TRUNCATE TABLE fact_review CASCADE;  
  INSERT INTO fact_review
  select *
  FROM std_review;
END;$$;

call load_fact_review();