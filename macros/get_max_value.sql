{% macro get_control_value(table_name, column_name) %}

   {% set sql %}
     select max({{column_name}}) from {{ table_name }}
   {% endset %}
   
   {% set results = run_query(sql) %}

   {{ return(results.columns[0].values()[0]) }}

{% endmacro %}