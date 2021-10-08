CREATE OR REPLACE PROCEDURE load_fact_business()
LANGUAGE plpgsql
AS $$
BEGIN
truncate table fact_business cascade;
INSERT INTO fact_business
  SELECT 
  business_id , 
  name , 
  address , 
  location_id ,
  postal_code ,
  latitude , 
  longitude , 
  stars , 
  review_count, 
  is_open ,  
  hours_sun_from ,
  hours_sun_to ,
  hours_mon_from ,
  hours_mon_to ,
  hours_tues_from ,
  hours_tues_to ,
  hours_wed_from ,
  hours_wed_to ,
  hours_thurs_from ,
  hours_thurs_to ,
  hours_fri_from ,
  hours_fri_to ,
  hours_sat_from ,
  hours_sat_to ,
  accepts_insurance   ,
  accepts_credit_card   ,
  ages_allowed ,
  by_appointment_only   ,
  bike_parking ,
  dogs_allowed ,
  good_for_dancing ,
  good_for_kids,
  happy_hour ,
  noise_level ,
  open_24_hours ,
  outdoor_seating ,
  restaurants_attire ,
  restaurants_reservation ,
  restaurants_good_for_groups ,
  restaurants_delivery,
  restaurants_table_service ,
  smoking ,
  wheel_chair_accessible ,
  wifi 
  FROM std_business sb
  JOIN dim_location loc 
    ON sb.city = loc.city
    AND sb.state = loc.state;  
END;$$;

call load_fact_business();