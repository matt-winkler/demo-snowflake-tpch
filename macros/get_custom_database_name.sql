{% macro generate_database_name(custom_database_name=none, node=none) -%}
    
    {%- set default_database = target.database -%}
    
    {%- if custom_database_name is not none and target.name == 'prod' -%}
        {{ "PROD_" ~ custom_database_name | trim }}        
    
    {%- elif custom_database_name is not none and target.name == 'qa' -%}
        {{ "ACC_" ~ custom_database_name | trim }}           
    
    {%- else -%}
        
        {{ target.name.upper() }}_{{ custom_database_name }}_{{ default_database }}
    
    {%- endif -%}

{%- endmacro %}