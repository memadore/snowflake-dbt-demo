with
    source as (select * from {{ source("tpcds", "date_dim") }}),
    renamed as (
        select
            d_date_sk as date_key,
            d_date_id as date_id,
            d_date as date,
            d_month_seq as month_sequence,
            d_week_seq as week_sequence,
            d_quarter_seq as quarter_sequence,
            d_year as year,
            d_dow as day_of_week,
            d_moy as month_of_year,
            d_dom as day_of_month,
            d_qoy as quarter_of_year,
            d_fy_year as fiscal_year,
            d_fy_quarter_seq as fiscal_quarter_sequence,
            d_fy_week_seq as fiscal_week_sequence,
            d_day_name as day_name,
            d_quarter_name as quarter_name,
            d_holiday as is_holiday,
            d_weekend as is_weekend,
            d_following_holiday as is_following_holiday,
            d_first_dom as first_day_of_month,
            d_last_dom as last_day_of_month,
            d_same_day_ly as same_day_last_year,
            d_same_day_lq as same_day_last_quarter,
            d_current_day as is_current_day,
            d_current_week as is_current_week,
            d_current_month as is_current_month,
            d_current_quarter as is_current_quarter,
            d_current_year as is_current_year
        from source
    )
select *
from renamed
