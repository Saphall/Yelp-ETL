 -- Check if stars between 0 and 5 or not 
  SELECT COUNT(*) as total_impacted_count,
	CASE WHEN COUNT(*)> 0 then 'failed'
	   ELSE 'passed'
	   END as test_status
FROM std_business
WHERE stars not between 0 and 5;