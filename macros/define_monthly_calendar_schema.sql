{% macro define_monthly_calendar_schema(monthly_calendar_name)%}

	key_year_period as key_{{monthly_calendar_name}}_year_period
	,year as {{monthly_calendar_name}}_year
	,quarter as {{monthly_calendar_name}}_quarter
	,month as {{monthly_calendar_name}}_month
	,month_name as {{monthly_calendar_name}}_month_name
	,month_name_short as {{monthly_calendar_name}}_month_name_short
	,year_month as {{monthly_calendar_name}}_year_month
	,year_month_numeric as {{monthly_calendar_name}}_year_month_numeric
	,first_of_month as first_of_{{monthly_calendar_name}}_month
	,last_of_month as last_of_{{monthly_calendar_name}}_month
	,first_of_next_month as first_of_next_{{monthly_calendar_name}}_month
	,last_of_next_month as last_of_next_{{monthly_calendar_name}}_month
	,first_of_quarter as first_of_{{monthly_calendar_name}}_quarter
	,last_of_quarter as last_of_{{monthly_calendar_name}}_quarter
	,first_of_year as first_of_{{monthly_calendar_name}}_year
	,last_of_year as last_of_{{monthly_calendar_name}}_year
	,is_leap_year as is_leap_{{monthly_calendar_name}}_year

{% endmacro %}