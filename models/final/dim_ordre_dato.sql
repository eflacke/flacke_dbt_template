{{config( schema='service' )}} 

select
    {{define_calendar_schema('ordre')}}
from {{ref('stg_dim_kalender')}}