{% macro get_query_tag() %}
  
  {% set manual_tag = 'manual_' ~ target.name %}
    
   ALTER SESSION SET QUERY_TAG =  {{ env_var('DBT_CLOUD_JOB_ID', manual_tag) }};

{% endmacro %}

