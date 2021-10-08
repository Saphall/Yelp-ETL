-- 4.  date checks if it is more than present 
 --b. review 
 SELECT COUNT(*) as total_impacted_count,
	CASE WHEN COUNT(*)> 0 then 'failed'
	   ELSE 'passed'
	   END as test_status
FROM std_review 
WHERE date > now()