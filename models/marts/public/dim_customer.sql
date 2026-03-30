with
    customer as (select * from {{ ref("stg_tpcds_customer") }}),
    final as (
        select
            customer_key,
            customer_id,
            salutation,
            first_name,
            last_name,
            is_preferred_customer = 'Y' as is_preferred_customer,
            birth_day,
            birth_month,
            birth_year,
            birth_country,
            login,
            email_address,
            last_review_date,
            current_address_key,
            current_customer_demographics_key,
            current_household_demographics_key,
            first_shipto_date_key,
            first_sales_date_key
        from customer
    )
select *
from final
