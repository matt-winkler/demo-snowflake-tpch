{{ 
    config(
      materialized='incremental_custom',
      incremental_strategy='merge',
      unique_key='customer_key',
      should_full_refresh=False,
      on_schema_change='append'
      ) 
}}

with customers as (
    SELECT * from {{ ref('stg_tpch_customers') }}
)

select * from customers

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  where customer_key not in (select customer_key from {{ this }} )

{% endif %}