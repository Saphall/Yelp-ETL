 -- Check if business has no category 
SELECT COUNT(*) as total_impacted_count,
	CASE WHEN COUNT(*)> 0 then 'failed'
	   ELSE 'passed'
	   END as test_status
FROM std_business 
WHERE categories ='{}'