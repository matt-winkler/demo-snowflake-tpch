{% macro persist_control_table(current_table, control_column) %}
   
   {% set sql %}
       
       create or replace table {{current_table}}_control as 
         select max({{control_column}}) as max_value from {{ current_table }}

   {% endset %}
   
   {{return(sql)}}

{% endmacro %}