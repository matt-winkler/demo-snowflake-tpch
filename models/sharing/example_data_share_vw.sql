{{ 
    config(
        materialized='view',
        secure=true,
        post_hook="{{ share_view ('dbt_mwinkler_private_demo', 'example_data_share_vw', 'example_data_share') }}"
        ) 
}}

with fct_orders_shared as (select * from {{ ref('fct_orders') }} ),

shared_ids as (select customer_key from {{ ref('data_share_rules') }} where UPPER(account_id) = CURRENT_ACCOUNT() )

select * 
from fct_orders_shared
where customer_key in (select * from shared_ids)