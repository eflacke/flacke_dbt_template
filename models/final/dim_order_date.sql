{{
config(
    meta = {'marts': ['procurement']}
)
}}

select
    {{define_calendar_schema('order')}}
from {{ref('stg_dim_calendar')}}