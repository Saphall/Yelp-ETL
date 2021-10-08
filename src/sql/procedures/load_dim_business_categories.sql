CREATE OR REPLACE PROCEDURE load_dim_business_categories()
LANGUAGE plpgsql
AS $$
BEGIN
truncate table dim_business_categories cascade;
INSERT into dim_business_categories
WITH cte_categories as (
SELECT 
	business_id,
    unnest(string_to_array(categories, ',')) as categories
FROM raw_business rb
)
SELECT business_id , category_id from cte_categories
INNER JOIN dim_categories d
ON cte_categories.categories = d.category_name;
END;$$;

call load_dim_business_categories();