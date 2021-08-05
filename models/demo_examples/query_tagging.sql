
{{
    config(
        sql_header=get_query_tag()
    )
}}

select * from {{ ref('stg_tpch_orders') }}
