{% macro share_view(view_schema, view_name, share_name) %}
  {% if target.name == "prod" %}

    {% set sql %}
      GRANT USAGE ON SCHEMA {{ target.database }}.{{ view_schema }} TO SHARE {{ share_name }};
      GRANT SELECT ON VIEW {{ target.database }}.{{ view_schema}}.{{ view_name }} TO SHARE {{ share_name }}
    {% endset %}

    {% set table = run_query(sql) %}

  {% endif %}

{% endmacro %}