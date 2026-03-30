with
    customer_demographics as (
        select * from {{ ref("stg_tpcds_customer_demographics") }}
    ),
    final as (
        select
            customer_demographics_key,
            gender,
            marital_status,
            education_status,
            purchase_estimate,
            credit_rating,
            dependent_count,
            dependent_employed_count,
            dependent_college_count
        from customer_demographics
    )
select *
from final
