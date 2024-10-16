{%- macro dimension_null_handling(stg_fact_column, dim_column) -%}
{#
    Gets the null handling case express for those following the norm.
    If something differs from the usual expression it must be written manually. 


    We could produce the whole sql dynamically if the naming was consistent for the codes 
    used in the lookup from the stg_fact table, with an 'exclude column' parameter for those
    not following the norm. 
    The prefixing of the roleplaying dimension would then also have to follow a norm downstream
    for this to work.

#}

{%- if execute -%}

        case    
            when stg_fact.{{stg_fact_column}} is null 
                then '-1'
            when {{dim_column}} is null 
                then '-2'
            else {{dim_column}} 
        end as {{dim_column}}

{%- endif -%}


{%- endmacro -%}