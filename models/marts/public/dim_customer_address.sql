with
    customer_address as (select * from {{ ref("stg_tpcds_customer_address") }}),
    final as (
        select
            address_key,
            address_id,
            street_number,
            street_name,
            street_type,
            suite_number,
            city,
            county,
            state,
            zip_code,
            country,
            gmt_offset,
            location_type
        from customer_address
    )
select *
from final
