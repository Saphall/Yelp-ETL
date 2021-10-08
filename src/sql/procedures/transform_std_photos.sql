CREATE OR REPLACE PROCEDURE transform_std_photos()
LANGUAGE plpgsql
AS $$
BEGIN
truncate table std_photos cascade;
insert into std_photos
select * from raw_photos ;
END;$$;

call transform_std_photos();