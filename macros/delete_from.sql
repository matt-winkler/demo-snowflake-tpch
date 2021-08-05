{% macro delete_from(relation) %}
  
  {% set table_exists = False %}
  
  {# check if relation exists #}
    {% if execute %}
      {% set sql = "SELECT COUNT(*) FROM information_schema.tables WHERE table_name = " ~ "'" ~ relation.name.upper() ~ "'" %}
      {% set results = run_query(sql).columns[0].values()[0] %}
      {% if results == 1 %}
        {% set table_exists = True %}
      {% endif %}
    {% endif %}
   
  {% if table_exists %}
    {% set sql = 'DELETE FROM ' ~ relation %}
    {% do run_query(sql) %}
  {% endif %}

{% endmacro %}