select distinct	
	year * 100 + month as key_year_period
	,year 
	,quarter 
	,month 
	,month_name 
	,month_name_short
	,year * 100 + month as year_month_numeric 
	,year_month 
	,first_of_month 
	,last_of_month 
	,first_of_next_month 
	,last_of_next_month 
	,first_of_quarter 
	,last_of_quarter 
	,first_of_year 
	,last_of_year 
	,is_leap_year 
from {{ref('stg_dim_calendar')}}