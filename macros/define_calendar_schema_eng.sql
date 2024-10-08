{% macro define_calendar_schema(calendar_name)%}

	key_date as key_{{calendar_name}}_date
	,date as {{calendar_name}}_date
	,year as {{calendar_name}}_year
	,iso_year as {{calendar_name}}_iso_year
	,quarter as {{calendar_name}}_quarter
	,month as {{calendar_name}}_month
	,month_name as {{calendar_name}}_month_name
	,month_name_short as {{calendar_name}}_month_name_short
	,year_month as {{calendar_name}}_year_month
	,week as {{calendar_name}}_week
	,iso_week as {{calendar_name}}_iso_week
	,day as {{calendar_name}}_day
	,weekday as {{calendar_name}}_weekday
	,weekday_name as {{calendar_name}}_weekday_name
	,weekday_name_short as {{calendar_name}}_weekday_name_short
	,day_of_year as {{calendar_name}}_day_of_year
	,is_weekend as is_{{calendar_name}}_date_weekend
	,first_of_week as first_of_{{calendar_name}}_week
	,last_of_week as last_of_{{calendar_name}}_week
	,week_of_month as {{calendar_name}}_week_of_month
	,first_of_month as first_of_{{calendar_name}}_month
	,last_of_month as last_of_{{calendar_name}}_month
	,first_of_next_month as first_of_next_{{calendar_name}}_month
	,last_of_next_month as last_of_next_{{calendar_name}}_month
	,first_of_quarter as first_of_{{calendar_name}}_quarter
	,last_of_quarter as last_of_{{calendar_name}}_quarter
	,first_of_year as first_of_{{calendar_name}}_year
	,last_of_year as last_of_{{calendar_name}}_year
	,is_leap_year as is_leap_{{calendar_name}}_year

{% endmacro %}
