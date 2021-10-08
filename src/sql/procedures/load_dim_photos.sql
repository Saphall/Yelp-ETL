CREATE OR REPLACE PROCEDURE load_dim_photos()
LANGUAGE plpgsql
AS $$
BEGIN
truncate table dim_photos cascade;
insert into dim_photos
select * from std_photos ;
END;$$;

call load_dim_photos();