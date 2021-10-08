# Data Warehouse Design

## Logical Modeling :

> ## Business Requirements:
The Yelp Data comes under business domain. Some of its business requirements are:

* Analyze the review provided by user to businesses
* Get Insight about the business information and ratings 
* Get user information and their attributes


According to the requirements and dataset, the dimension and fact table can be: 

> ### Identifying Dimension Tables:
*  **dim_location** - location_id (PK) , city, state 
*  **dim_categories** - category_id (PK), category_name
*  **dim_business_categories**  - business_id , category_id
*  **dim_photos** - photo_id  ,business_id ,caption ,label 	
*  **dim_elite_years** - user_id ,elite_year
*  **dim_** - paycode_id, paycode

> ### Identifying Fact Tables:
* **fact_business** : This table contains the data related to business and its attributes.
* **fact_checkin** : This table contains info about the checkin date for business.
* **fact_review** : This table contains the data related to review given by user on different businesses.
* **fact_tip** : This table contains info about the tip provided by user to business.
* **fact_user** : This table contains the data related to user and their attributes.


The description of Entities, Attributes and their domain:


| **Entities**         | **Description**                         | **Domain** |
|----------------------|-----------------------------------------|------------|
|**dim_location**| Information on business city and state.     |            |
|<p>**Attributes :**</p><p>location_id</p><p></p><p>city</p><p></p><p>state</p><p>|<p></p><p></p><p>Identifier of entity, PK</p><p>Name of city</p><p>State</p><p>|<p></p><p>SERIAL</p><p>Text</p><p>Text</p><p>|
|**dim_categories**| Categories of business.     |            |
|<p>**Attributes :**</p><p>category_id</p><p></p><p>category_name</p><p></p>|<p></p><p></p><p>Identifier of entity, PK</p><p>Category Name</p><p>|<p></p><p>SERIAL</p><p>Text</p>|
|**dim_business_categories**| Relational table between Categories and business.     |            |
|<p>**Attributes :**</p><p>business_id</p><p></p><p>category-id</p><p>|<p></p><p></p><p>Identifier of entity fact_business</p><p>Identifier of entity dim_categories</p><p>|<p></p><p>Valid id from fact_business table</p><p>Valid id from dim_categories table</p>|
|**dim_photos**| Photo Infomation about business.   |            |
|<p>**Attributes :**</p><p>photo_id</p><p></p><p>business_id</p><p>caption</p>label</p>|<p></p><p></p><p>Identifier of entity</p><p>Valid id from fact_business table</p><p>Description of photo.</p><p>Label of photo</p>|<p>Text</p><p>Text<p></p></p><p>Text</p><p>Text</p>|
|**dim_elite_years**| Elite years of user.         |            |
|<p>**Attributes :**</p><p>user_id</p><p></p><p>elite_year</p>|<p></p><p></p><p>Valid id from fact_user</p><p>Elite year</p>|<p></p><p>Text</p><p>Text</p>|
|**fact_business**| Information about business.             |            |
|<p>**Attributes :**</p><p>business_id</p><p></p><p>name</p><p>street</p><p>location_id</p><p>postal_code</p><p>latitude</p>longitude <p> stars<p> review_count <p>is_open<p> hours_sun_from<p> hours_sun_to<p> hours_mon_from <p>hours_mon_to <p>hours_tues_from<p> hours_tues_to <p>hours_wed_from <p> hours_wed_to<p> hours_thurs_from <p>hours_thurs_to <p>     hours_fri_from   <p>   hours_fri_to<p>        hours_sat_from <p>     hours_sat_to    <p>    accepts_insurance <p>  accepts_credit_card<p> ages_allowed <p>       by_appointment_only<p> bike_parking <p>       dogs_allowed<p>        good_for_dancing <p>   good_for_kids  <p>     happy_hour  <p>        noise_level  <p>       open_24_hours  <p>     outdoor_seating<p>     restaurants_attire <p> restaurants_reservation <p>restaurants_good_for_groups<p> restaurants_delivery <p>restaurants_table_service <p> smoking<p>             wheel_chair_accessible <p> wifi    <p>  | Valid id from fact_business. <p> Name of business.  <p> Street.  <p>  Valid id from dim_location.   <p> Postal Code.  <p>Latitude. <p> Longitude.  <p> Stars received. <p>  Review obtained count.   <p>Information if open or not.  <p> Sunday start time.  <p>Sunday end time.  <p>Monday start time. <p> Monday end time.  <p>Tuesday start time. <p> Tuesday end time. <p> Wednesday start time.  <p>Wednesday End time. <p> Thursday start time.  <p>Thursaday end time.  <p> Friday start time.   <p>Friday end time.  <p>Saturday start time. <p>  Saturday end time. <p>  Boolean attribute.  <p> Boolean attribute.  <p>Ages of people allowed. <p>  Boolean attribute. <p> Boolean attribute. <p> Boolean attribute.  <p>Boolean attribute. <p> Boolean attribute. <p> Boolean attribute.  <p>Level of noise.  <p>Info about whether open 24 hours or not.  <p> Boolean attribute. <p> Boolean attribute. <p> Boolean attribute.  <p>Boolean attribute. <p> Boolean attribute. <p> Boolean attribute.  <p>Boolean attribute.  <p>Boolean attribute.  <p>Boolean attribute. <p> | <p> Text<p> Text<p> Text <p>INT <p>VARCHAR<p> FLOAT<p> FLOAT<p> FLOAT<p> INT <p>BOOLEAN<p> TIME <p> TIME <p>TIME<p> TIME<p> TIME<p> TIME <p>TIME <p>TIME<p> TIME<p> TIME<p> TIME <p>TIME <p>TIME<p> TIME <p>BOOLEAN <p>BOOLEAN<p>  TEXT <p>BOOLEAN <p>BOOLEAN <p>BOOLEAN<p> BOOLEAN <p>BOOLEAN <p>BOOLEAN <p>TEXT <p>BOOLEAN<p> BOOLEAN<p> BOOLEAN<p> BOOLEAN<p> BOOLEAN <p>BOOLEAN <p>BOOLEAN <p>BOOLEAN<p> BOOLEAN <p>BOOLEAN<p>  |
|**fact_user**| Information about user.                          |            |
|<p>**Attributes :**</p><p>user_id</p><p></p><p>name</p><p>review_count</p><p>yelping_since</p> friends <p> friends_count<p> useful<p> funny <p>cool<p> fans <p>elite_count <p> average_stars<p>  compliment_hot<p>  compliment_more <p> compliment_profile<p>  compliment_cute<p> compliment_list<p> comliment_note<p> compliment_plain <p> compliment_cool<p>  compliment_funny <p> compliment_writer  <p>compliment_photos<p>|<p></p><p>Identifier of entity<p><p>Name of User<p/><p>Number of reviews.</p><p>Yelping start time.</p> Array of friends. <p>Number of friends.  <p>Useful vote obtained. <p>Funny vote obtained. <p>Cool vote obtained. <p>Number of fans.  <p>Elite count. <p>Average stars obtained. <p>Hot complement received.<p> More complement received.<p> Profile complement received. <p>Cute complement received.<p> List complement received.<p> Note complement received.<p> Cool complement received.<p> Funny complement received. <p>Writer complement received. <p>Photos complement received.<p>|</p><p>TEXT</p><p>Text</p><p>INT</p><p>Timestamp</p> TEXT <p>INT<p> INT <p>INT<p> INT<p> INT <p>INT <p>FLOAT<p> INT <p>INT <p>INT<p> INT<p> INT <p>INT <p>INT<p> INT <p>INT <p>INT <p>INT<p>|
|**fact_review**| Information about review given by user to business.               |            |
|<p>**Attributes :**</p><p>review_id</p><p></p><p>user_id</p>business_id<p> stars  <p>date <p> text <p>useful <p>funny<p> cool<p>|<p></p><p></p><p>Identifier of entity.</p><p>Valid id from fact_user.</p> Valid id from fact_business. <p>Total stars in review.<p> Date of review. <p> Review text. <p>Useful vote received. <p>Funny vote received. <p>Cool vote received.<p>|<p>Text</p><p>Text</p> Text <p>INT <p>DATE<p> TEXT <p>INT<p> INT<p> INT<p> |
|**fact_checkin**| The checkin obtained by business   |            |
|<p>**Attributes :**</p><p>checkin_id</p><p></p><p>business_id</p>|<p></p><p>Identifier of entity.</p><p>Valid id from fact_business table.</p>| <p>Text <p></p> Text <p>|
|**fact_tip**| Information about tip given by user to business.               |            |
|<p>**Attributes :**</p><p>tip_id</p><p></p><p>user_id</p>business_id<p> text  <p>date <p> compliment_count <p>|<p></p><p></p><p>Identifier of entity.</p><p>Valid id from fact_user.</p> Valid id from fact_business. <p>Tip text.<p> Date of tip. <p> Count of complement received in tip.|<p>Serial</p><p>Text</p> Text <p>Text <p>DATE<p> INT<p> |

> ### Logical Model :

<img src = './images/Yelp-ETL-model.png'>


## Physical Modeling:

In physical modeling the facts and dimensions are implemented. The physical model implementd using Logical modeling are listed in [../schema/](../schema) folder. 

