with
    catalog_page as (select * from {{ ref("stg_tpcds_catalog_page") }}),
    final as (
        select
            catalog_page_key,
            catalog_page_id,
            department,
            catalog_number,
            catalog_page_number,
            description,
            type,
            start_date_key,
            end_date_key
        from catalog_page
    )
select *
from final
