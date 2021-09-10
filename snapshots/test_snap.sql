{% snapshot test_snap %}

{{
    config(
        target_schema='snapshots',
        strategy='check',
        unique_key='order_key',
        check_cols=['status_code']
    )
}}

select * from {{ ref('stg_tpch_orders') }}

{% endsnapshot %}