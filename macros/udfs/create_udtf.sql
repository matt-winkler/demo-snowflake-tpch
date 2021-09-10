{% macro create_udtf() %}
  
  {% set sql %}
    create or replace function t()
    returns table(msg varchar)
    as
    $$
        select 'Hello'
        union
        select 'World'
    $$;
  {% endset %}

  {% do run_query(sql) %}

  {% do log('created udtf function', info=true) %}

{% endmacro %}