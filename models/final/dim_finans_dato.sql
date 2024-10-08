{{config( schema='service' )}} 

select
    {{define_monthly_calendar_schema('finans')}}
from {{ref('stg_dim_måneds_kalender')}}