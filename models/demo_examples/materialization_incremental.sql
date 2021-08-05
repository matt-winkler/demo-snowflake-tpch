{{ 
    config(
      materialized='incremental',
      incremental_strategy='delete+insert',
      unique_key='customer_key'
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