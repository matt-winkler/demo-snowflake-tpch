{{
    config(
        materialized='materialized_view',
        automatic_clustering=false,
        cluster_by=['nation_key'],
        secure=false
    )
}}

select * from {{ source('tpch', 'nation') }}