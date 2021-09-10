{% macro insert_to_target(this_relation, target_relation) %}
  
   {% set sql = 'INSERT INTO ' ~ target_relation ~ ' SELECT * FROM ' ~ this_relation %}

   {% do log(sql, info=true) %}

{% endmacro %}