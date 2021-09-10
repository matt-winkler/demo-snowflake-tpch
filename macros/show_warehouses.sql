{% macro show_ware() %}
  {% set sql = 'SHOW WAREHOUSES' %}

  {% set results = run_query(sql) %}

  {% do log(results, info=true) %}


{% endmacro %}