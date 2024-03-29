{{ 
    config(
      materialized='incremental',
      incremental_strategy='merge',
      unique_key='order_key'
      ) 
}}

{% if is_incremental() %}
  {% set max_order_date = get_control_value(this, 'order_date') %}
{% endif %}

with order_items as (
    select * 
    from {{ ref('stg_tpch_orders') }}
    {% if is_incremental() %}
     -- this filter will only be applied on an incremental run
       where order_date > DATEADD(year, -1, '{{max_order_date}}')
    
    {% else %}

       where order_date < '1997-01-01'

    {% endif %}
)

select * from order_items