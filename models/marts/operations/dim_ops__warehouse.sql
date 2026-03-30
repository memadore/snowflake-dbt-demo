with
    warehouse as (select * from {{ ref("stg_tpcds_warehouse") }}),
    final as (
        select
            warehouse_key,
            warehouse_id,
            warehouse_name,
            warehouse_square_footage,
            street_number,
            street_name,
            street_type,
            suite_number,
            city,
            county,
            state,
            zip_code,
            country,
            gmt_offset
        from warehouse
    )
select *
from final
