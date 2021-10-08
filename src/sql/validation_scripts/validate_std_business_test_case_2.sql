-- Check whether business hours are not correct 
SELECT COUNT(*) as total_impacted_count,
	CASE WHEN COUNT(*)> 0 then 'failed'
	   ELSE 'passed'
	   END as test_status
FROM std_business 
WHERE hours_sun_from < '0:0' or hours_sun_from > '24:0' or 
hours_sun_to < '0:0' or hours_sun_to > '24:0' or 
  hours_mon_from < '0:0' or hours_mon_from> '24:0' or 
  hours_mon_to < '0:0' or hours_mon_to > '24:0'or 
  hours_tues_from < '0:0' or hours_tues_from > '24:0'or
  hours_tues_to < '0:0' or hours_tues_to > '24:0'or
  hours_wed_from < '0:0' or hours_wed_from > '24:0'or
  hours_wed_to < '0:0' or hours_wed_to > '24:0'or
  hours_thurs_from < '0:0' or hours_thurs_from > '24:0'or
  hours_thurs_to < '0:0' or hours_thurs_to > '24:0'or
  hours_fri_from < '0:0' or hours_fri_from > '24:0' or 
  hours_fri_to < '0:0' or hours_fri_to > '24:0' or 
  hours_sat_from < '0:0' or hours_sat_from > '24:0' or 
  hours_sat_to < '0:0' or hours_sat_to > '24:0';