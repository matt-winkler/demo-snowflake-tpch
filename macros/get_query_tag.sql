{% macro get_sql_query_tags() %}
   ALTER SESSION SET QUERY_TAG = {{ env_var('DBT_CLOUD_JOB_ID', 'manual')}};
{% endmacro %}