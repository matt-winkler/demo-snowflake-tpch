{{
    config(
        materialized='table',
        post_hook="{{ logging.log_model_start_event() }}"
    )
}}

with my_data as ( 
    select 1 as id, 'aaa' as text_value 
    union all
    select 2 as id, 'bbb' as text_value 
    union all
    select 3 as id, 'ccc' as text_value
)

select * from my_data