with
    web_site as (select * from {{ ref("stg_tpcds_web_site") }}),
    final as (
        select
            web_site_key,
            web_site_id,
            name,
            class,
            manager,
            market_id,
            market_class,
            market_description,
            market_manager,
            company_id,
            company_name,
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
            tax_percentage,
            open_date_key,
            close_date_key,
            record_start_date,
            record_end_date,
            record_end_date is null as is_current_record
        from web_site
    )
select *
from final
