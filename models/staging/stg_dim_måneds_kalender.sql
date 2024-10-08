with dim as(
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
	from {{ref('stg_dim_kalender')}}
)

,norsk as (
    select
        *,
        -- Norske månedsnavn
        case month
            when 1 then 'Januar'
            when 2 then 'Februar'
            when 3 then 'Mars'
            when 4 then 'April'
            when 5 then 'Mai'
            when 6 then 'Juni'
            when 7 then 'Juli'
            when 8 then 'August'
            when 9 then 'September'
            when 10 then 'Oktober'
            when 11 then 'November'
            when 12 then 'Desember'
        end as month_name_nor,

        -- Norske kortform av månedsnavn
        case month
            when 1 then 'Jan'
            when 2 then 'Feb'
            when 3 then 'Mar'
            when 4 then 'Apr'
            when 5 then 'Mai'
            when 6 then 'Jun'
            when 7 then 'Jul'
            when 8 then 'Aug'
            when 9 then 'Sep'
            when 10 then 'Okt'
            when 11 then 'Nov'
            when 12 then 'Des'
        end as month_name_short_nor
	from dim
)

select * from norsk