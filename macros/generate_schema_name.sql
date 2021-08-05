{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    
    {%- if custom_schema_name is none -%}
        {{ default_schema }}
    
    {%- else -%}
        {%- if target.name == 'default' -%}
        {#/* Used for the default developer schema . Username + Customer Shcema name from the dbt_project.yml */#}
              {{ default_schema }}_{{ custom_schema_name | trim }}             
        {%- else -%}
        {#/* Any job that is configured ensure that the target name is not set to default */#}
            {{ custom_schema_name | trim }}
        {%- endif -%}
    
    {%- endif -%}

{%- endmacro %}