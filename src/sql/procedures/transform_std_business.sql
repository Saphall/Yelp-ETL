CREATE OR REPLACE PROCEDURE transform_std_business()
LANGUAGE plpgsql
AS $$
BEGIN
 TRUNCATE TABLE std_business CASCADE;
  INSERT INTO std_business
  SELECT 
  business_id,
  name,
  address,
  city,
  state,
  postal_code,
  CAST (latitude AS FLOAT),
  CAST (longitude AS FLOAT),
  CAST (stars AS FLOAT),
  CAST (review_count AS INT),
  case when attributes ->> is_open = '1' then TRUE else false end,
  string_to_array(categories, ','),
  CAST(SPLIT_PART(hours ->> 'Sunday', '-', 1) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Sunday', '-', 2) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Monday', '-', 1) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Monday', '-', 2) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Tuesday', '-', 1) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Tuesday', '-', 2) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Wednesday', '-', 1) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Wednesday', '-', 2) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Thursday', '-', 1) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Thursday', '-', 2) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Friday', '-', 1) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Friday', '-', 2) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Saturday', '-', 1) AS TIME),
  CAST(SPLIT_PART(hours ->> 'Saturday', '-', 2) AS TIME),
  CASE WHEN attributes ->> 'AcceptsInsurance' IS null THEN FALSE
    WHEN attributes ->> 'AcceptsInsurance' = 'None'THEN FALSE
  	else CAST(attributes ->> 'AcceptsInsurance' AS BOOLEAN) END,
  case WHEN attributes ->> 'BusinessAcceptsCreditCards' IS NULL THEN false
  	WHEN attributes ->> 'BusinessAcceptsCreditCards' = 'None'THEN FALSE
  	ELSE CAST(attributes ->> 'BusinessAcceptsCreditCards' AS BOOLEAN) END,
  CASE WHEN attributes ->> 'AgesAllowed' IS null THEN ''
  	WHEN attributes ->> 'AgesAllowed' = 'None' THEN ''
  	ELSE CAST(  attributes ->> 'AgesAllowed' AS VARCHAR) END,
  CASE WHEN attributes ->> 'ByAppointmentOnly' IS null THEN FALSE
    WHEN attributes ->> 'ByAppointmentOnly' = 'None' THEN FALSE
  	ELSE CAST(  attributes ->> 'ByAppointmentOnly' AS BOOLEAN)  END,
  CASE WHEN attributes ->> 'BikeParking' IS null THEN false
  	WHEN attributes ->> 'BikeParking' = 'None' THEN FALSE
 	 else  CAST( attributes ->> 'BikeParking' AS BOOLEAN) END,
  CASE WHEN attributes ->> 'DogsAllowed' IS NULL THEN FALSE
    WHEN attributes ->> 'DogsAllowed' = 'None' THEN FALSE
  	ELSE CAST(   attributes ->> 'DogsAllowed'  AS BOOLEAN) END,
  CASE WHEN attributes ->> 'GoodForDancing' IS NULL THEN FALSE
    WHEN attributes ->> 'GoodForDancing' = 'None'THEN FALSE
  	ELSE CAST( attributes ->> 'GoodForDancing'  AS BOOLEAN) END,
  CASE  WHEN attributes ->> 'GoodForKids' IS NULL  THEN FALSE
    WHEN attributes ->> 'GoodForKids' = 'None' THEN FALSE
  	ELSE  CAST( attributes ->> 'GoodForKids'  AS BOOLEAN)  END,
  CASE  WHEN attributes ->> 'HappyHour' IS NULL  THEN FALSE
    WHEN attributes ->> 'HappyHour' = 'None'   THEN FALSE
  	else  CAST( attributes ->> 'HappyHour'   AS BOOLEAN)  end,
  CASE   WHEN attributes ->> 'NoiseLevel' IS NULL  THEN ''
    WHEN attributes ->> 'NoiseLevel' = 'None'  THEN ''
  	ELSE  CAST( attributes ->> 'NoiseLevel'  AS varchar) END,
  CASE   WHEN attributes ->> 'Open24Hours' IS NULL THEN FALSE
    WHEN attributes ->> 'Open24Hours' = 'None'   THEN false
    ELSE  CAST(   attributes ->> 'Open24Hours'  AS BOOLEAN) END,
  CASE WHEN attributes ->> 'OutdoorSeating' IS NULL THEN false
  	WHEN attributes ->> 'OutdoorSeating' = 'None' THEN false
  	ELSE  CAST(   attributes ->> 'OutdoorSeating'   AS BOOLEAN) END,
  CASE WHEN attributes ->> 'RestaurantsAttire' IS NULL THEN ''
    WHEN attributes ->> 'RestaurantsAttire' = 'None' THEN ''
  	ELSE CAST(  attributes ->> 'RestaurantsAttire'  AS VARCHAR) END,
  CASE WHEN attributes ->> 'RestaurantsReservations' IS NULL THEN FALSE
    WHEN attributes ->> 'RestaurantsReservations' = 'None' THEN FALSE
  	ELSE CAST(  attributes ->> 'RestaurantsReservations'    AS BOOLEAN) END,
  CASE  WHEN attributes ->> 'RestaurantsGoodForGroups' IS NULL THEN FALSE
    WHEN attributes ->> 'RestaurantsGoodForGroups' = 'None' THEN FALSE
 	ELSE CAST( attributes ->> 'RestaurantsGoodForGroups'  AS BOOLEAN)END,
  CASE   WHEN attributes ->> 'RestaurantsDelivery' IS NULL THEN FALSE
    WHEN attributes ->> 'RestaurantsDelivery' = 'None' THEN FALSE
  	ELSE CAST(    attributes ->> 'RestaurantsDelivery'  AS BOOLEAN) END,
  CASE WHEN attributes ->> 'RestaurantsTableService' IS NULL THEN FALSE
    WHEN attributes ->> 'RestaurantsTableService' = 'None' THEN FALSE
  	ELSE  CAST(   attributes ->> 'RestaurantsTableService'  AS BOOLEAN)END,
  CASE WHEN attributes ->> 'Smoking' IS NULL  THEN ''
  	WHEN attributes ->> 'Smoking' = 'None'  THEN ''
  	ELSE CAST(  attributes ->> 'Smoking'  AS VARCHAR) END,
  CASE WHEN attributes ->> 'WheelchairAccessible' IS null
  	THEN FALSE  WHEN attributes ->> 'WheelchairAccessible' = 'None'THEN false
  	ELSE CAST(  attributes ->> 'WheelchairAccessible' AS BOOLEAN) END,
  CASE  WHEN attributes ->> 'WiFi' IS NULL  THEN ''
    WHEN attributes ->> 'WiFi' = 'None' THEN ''	
    else CAST(attributes ->> 'WiFi' AS VARCHAR) END  
  FROM raw_business;  
END;$$;

CALL transform_std_business();