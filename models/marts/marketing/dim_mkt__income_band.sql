with
    income_band as (select * from {{ ref("stg_tpcds_income_band") }}),
    final as (select income_band_key, lower_bound, upper_bound from income_band)
select *
from final
