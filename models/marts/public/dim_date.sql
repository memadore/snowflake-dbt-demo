with
    date_dim as (select * from {{ ref("stg_tpcds_date_dim") }}),
    final as (
        select
            date_key,
            date_id,
            date,
            day_name,
            day_of_week,
            day_of_month,
            month_of_year,
            quarter_of_year,
            year,
            quarter_name,
            month_sequence,
            week_sequence,
            quarter_sequence,
            fiscal_year,
            fiscal_quarter_sequence,
            fiscal_week_sequence,
            first_day_of_month,
            last_day_of_month,
            same_day_last_year,
            same_day_last_quarter,
            is_holiday = 'Y' as is_holiday,
            is_weekend = 'Y' as is_weekend,
            is_following_holiday = 'Y' as is_following_holiday,
            is_current_day = 'Y' as is_current_day,
            is_current_week = 'Y' as is_current_week,
            is_current_month = 'Y' as is_current_month,
            is_current_quarter = 'Y' as is_current_quarter,
            is_current_year = 'Y' as is_current_year
        from date_dim
    )
select *
from final
