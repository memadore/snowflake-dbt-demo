with
    store as (select * from {{ ref("stg_tpcds_store") }}),
    final as (
        select
            store_key,
            store_id,
            store_name,
            employee_count,
            floor_space,
            hours,
            manager,
            market_id,
            geography_class,
            market_description,
            market_manager,
            division_id,
            division_name,
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
            closed_date_key,
            record_start_date,
            record_end_date,
            record_end_date is null as is_current_record
        from store
    )
select *
from final
