{{ 
    config(
      materialized='incremental',
      incremental_strategy='merge',
      unique_key='order_item_key',
      cluster_by=['order_date']
      ) 
}}

with order_items as (
    
    select * 
    from {{ ref('order_items') }}
    
    {% if is_incremental() %}
     -- this filter will only be applied on an incremental run
       where order_date >= (select max(order_date) from {{ this }})
    
    {% else %}

       where order_date < '1997-01-01'

    {% endif %}
)

select * from order_items