{%- macro get_columns(dbt_relation) %}
    {% set columns_query %}
    select 
        c.name as column_name,
        t.name as column_type
    from sys.columns c
    inner join sys.types t
        on c.user_type_id = t.user_type_id
    where c.object_id = object_id('{{ dbt_relation }}')
    {% endset %}
    
    {% set results = run_query(columns_query) %}

    {% if execute %}
        {% set results_list = results.rows %}
    {% else %}
        {% set results_list = [] %}
    {% endif %}

    {{ return(results_list) }}
{%- endmacro %}