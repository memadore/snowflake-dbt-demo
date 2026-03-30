with
    household_demographics as (
        select * from {{ ref("stg_tpcds_household_demographics") }}
    ),
    income_band as (select * from {{ ref("stg_tpcds_income_band") }}),
    final as (
        select
            household_demographics.household_demographics_key,
            household_demographics.income_band_key,
            income_band.lower_bound as income_band_lower_bound,
            income_band.upper_bound as income_band_upper_bound,
            household_demographics.buy_potential,
            household_demographics.dependent_count,
            household_demographics.vehicle_count
        from household_demographics
        left join
            income_band
            on household_demographics.income_band_key = income_band.income_band_key
    )
select *
from final
