{{
config(
    meta = {'marts': ['project_accounting', 'cost_center']}
)
}}

select
    {{define_monthly_calendar_schema('fiscal')}}
from {{ref('stg_dim_monthly_calendar')}}