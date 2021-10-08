TRUNCATE TABLE temp_business;
\COPY temp_business FROM   '/home/saphal/1Saphal/20Data_Engineering/JSON/business.json';
TRUNCATE TABLE raw_business;
INSERT INTO raw_business
  SELECT   
  data ->> 'business_id',
  data ->> 'name',
  data ->> 'address',
  data ->> 'city',
  data ->> 'state',
  data ->> 'postal_code',
  data ->> 'latitude',
  data ->> 'longitude',
  data ->> 'stars',
  data ->> 'review_count',
  data ->> 'is_open',
  data -> 'attributes',
  data ->> 'categories',
  data -> 'hours'
FROM temp_business ;

