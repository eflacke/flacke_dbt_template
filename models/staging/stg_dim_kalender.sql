with date_spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2000-01-01' as date)",
        end_date="cast('2040-01-01' as date)"
    )
    }}
)

,cast_as_date as (
    select cast(date_day as date) as date_day from date_spine
	union
	select '1970-01-01'
	union
	select '2100-01-01'
)

,dates as (
	select 
		date = convert(date, date_day)
		,year = datepart(year, date_day)
		,quarter = datepart(quarter, date_day)
		,month = datepart(month, date_day)
		,month_name = datename(month, date_day)
		,month_name_short = format(date_day, 'MMM')
		,first_of_month = datefromparts(year(date_day), month(date_day), 1)
		,day = datepart(day, date_day)
		,week = datepart(week, date_day)
		,iso_week = datepart(iso_week, date_day)
		,weekday = datepart(weekday, date_day)
		,weekday_name = format(date_day, 'dddd')
		,weekday_name_short = format(date_day, 'ddd')
		,last_of_year = datefromparts(year(date_day), 12, 31)
		,day_of_year = datepart(dayofyear, date_day)
	from cast_as_date
)

,dim as (
	select 
		key_date =  year(date) * 10000 + month(date) * 100 + day(date)
		,date
		,year
		,iso_year = year - case when month = 1 and iso_week > 51 then 1 when month = 12 and iso_week = 1 then - 1 else 0 end
		,quarter
		,month
		,month_name
		,month_name_short 
		,year_month = format(date, 'yyyy-MM')
		,week
		,year_week = format(date, 'yyyy-WW')
		,iso_week
		,day
		,weekday
		,weekday_name
		,weekday_name_short
		,day_of_year
		,is_weekend = case when weekday in (case @@datefirst when 1 then 6 when 7 then 1 end, 7) then 1 else 0 end
		,first_of_week = dateadd(day, 1 - weekday, date)
		,last_of_week = dateadd(day, 6, dateadd(day, 1 - weekday, date))
		,week_of_month = convert(tinyint, dense_rank() over (partition by year, month order by week))
		,first_of_month
		,last_of_month = max(date) over (partition by year, month)
		,first_of_next_month = dateadd(month, 1, first_of_month)
		,last_of_next_month = dateadd(day, - 1, dateadd(month, 2, first_of_month))
		,first_of_quarter = min(date) over (partition by year, quarter)
		,last_of_quarter = max(date) over (partition by year, quarter)
		,first_of_year = datefromparts(year, 1, 1)
		,last_of_year
		,is_leap_year = convert(bit, case when (year % 400 = 0) or (year % 4 = 0 and year % 100 <> 0) then 1 else 0 end)
		{# ,has_53_weeks = case when datepart(week, last_of_year) = 53 then 1 else 0 end
		,has_53_iso_weeks = case when datepart(iso_week, last_of_year) = 53 then 1 else 0 end #}
	from dates
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
        end as month_name_short_nor,

        -- Norske ukedager
        case weekday
            when 1 then 'Søndag'
            when 2 then 'Mandag'
            when 3 then 'Tirsdag'
            when 4 then 'Onsdag'
            when 5 then 'Torsdag'
            when 6 then 'Fredag'
            when 7 then 'Lørdag'
        end as weekday_name_nor,

        -- Norske kortform av ukedager
        case weekday
            when 1 then 'Søn'
            when 2 then 'Man'
            when 3 then 'Tir'
            when 4 then 'Ons'
            when 5 then 'Tor'
            when 6 then 'Fre'
            when 7 then 'Lør'
        end as weekday_name_short_nor
    from dim
)

select * from norsk