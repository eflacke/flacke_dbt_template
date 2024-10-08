{% macro define_monthly_calendar_schema(monthly_calendar_name)%}

	key_year_period as key_{{monthly_calendar_name}}_år_periode
	,year as {{monthly_calendar_name}}_år
	,quarter as {{monthly_calendar_name}}_kvartal
	,month as {{monthly_calendar_name}}_måned
	,month_name_nor as {{monthly_calendar_name}}_måned_navn
	,month_name_short_nor as {{monthly_calendar_name}}_måned_navn_kort
	,year_month as {{monthly_calendar_name}}_år_måned
	,year_month_numeric as {{monthly_calendar_name}}_år_måned_numerisk
	,first_of_month as først_i_{{monthly_calendar_name}}_måned
	,last_of_month as sist_i_{{monthly_calendar_name}}_måned
	,first_of_next_month as først_i_neste_{{monthly_calendar_name}}_måned
	,last_of_next_month as sist_i_neste_{{monthly_calendar_name}}_måned
	,first_of_quarter as først_i_{{monthly_calendar_name}}_kvartal
	,last_of_quarter as sist_i_{{monthly_calendar_name}}_kvartal
	,first_of_year as først_i_{{monthly_calendar_name}}_år
	,last_of_year as sist_i_{{monthly_calendar_name}}_år
	,is_leap_year as er_skudd_{{monthly_calendar_name}}_år

{% endmacro %}
