CREATE OR REPLACE PROCEDURE load_dim_elite_years()
LANGUAGE plpgsql
AS $$
BEGIN
truncate table dim_elite_years cascade;
insert into dim_elite_years 
SELECT 
	user_id,
    unnest(string_to_array(elite, ','))  as elite_year
from (
    select user_id,replace(elite,'20,20','2020') as elite   
    from raw_user 
) ru;
 END;$$;

call load_dim_elite_years();