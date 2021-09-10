{{
    config(
        materialized='table',
        copy_grants=true
    )
}}

with source_data as ( select * from {{ref('stg_tpch_orders') }} )

select * from source_data