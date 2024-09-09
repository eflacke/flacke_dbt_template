{%- macro clean_blank_values_in_source(source_model) %}

{% for row in get_columns(source_model) %}
    {{ "," if not loop.first }}
    {% if row['column_type'] in ['nvarchar', 'varchar'] -%}
        nullif(trim({{ row['column_name'] }}), '') as {{ row['column_name'] }}
    {%- else -%}
        {{ row['column_name'] }}
    {%- endif %}
{%- endfor %}

{%- endmacro %}