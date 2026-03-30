with
    time_dim as (select * from {{ ref("stg_tpcds_time_dim") }}),
    final as (
        select
            time_key,
            time_id,
            time_in_seconds,
            hour,
            minute,
            second,
            am_pm,
            shift,
            sub_shift,
            meal_time
        from time_dim
    )
select *
from final
