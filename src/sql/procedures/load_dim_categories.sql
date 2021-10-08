CREATE OR REPLACE PROCEDURE load_dim_categories()
LANGUAGE plpgsql
AS $$
BEGIN
truncate table dim_categories restart identity;
insert into dim_categories (category_name)
select distinct unnest(string_to_array( categories , ',')) as categories from raw_business  ;
END;$$;

call load_dim_categories();