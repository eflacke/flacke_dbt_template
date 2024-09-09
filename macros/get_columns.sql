{% macro get_columns(dbt_relation)%}

{%- set drop_query %}
drop table if exists #tmp_{{dbt_relation.identifier}}_cols;
{% endset %}
{%- do run_query(drop_query)%}

{%- set into_query %}
select top 0 * into #tmp_{{dbt_relation.identifier}}_cols from {{dbt_relation}};
{% endset %}
{%- do run_query(into_query)%}

{% set columns_query %}
select
    columns.name as column_name
    ,types.name as column_type
from tempdb.sys.columns
inner join tempdb.sys.types
    on columns.system_type_id = types.user_type_id
where object_id = object_id('tempdb.dbo.#tmp_{{dbt_relation.identifier}}_cols');
{% endset %}
{% set results = run_query(columns_query) %}

{# execute is a Jinja variable that returns True when dbt is in "execute" mode i.e. True when running dbt run but False during dbt compile. #}
{% if execute %}
{# agate.table.rows is agate.MappedSequence in which data that can be accessed either by numeric index or by key. #}
{% set results_list = results.rows %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}