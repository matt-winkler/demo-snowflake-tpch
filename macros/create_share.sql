{% macro create_share(share_name, accounts) %}
  {% if target.name == "prod" %}

    {% set sql %}
      CREATE SHARE IF NOT EXISTS {{ share_name }};
      GRANT USAGE ON DATABASE {{ target.database }} TO SHARE {{ share_name }};

      {% for account in accounts %}
        ALTER SHARE {{ share_name }} ADD ACCOUNTS = {{ account }};
      {% endfor %}

    {% endset %}

    {% set table = run_query(sql) %}

  {% endif %}

{% endmacro %}