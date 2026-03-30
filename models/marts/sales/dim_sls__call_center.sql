with
    call_center as (select * from {{ ref("stg_tpcds_call_center") }}),
    final as (
        select
            call_center_key,
            call_center_id,
            name,
            class,
            employee_count,
            square_footage,
            hours,
            manager,
            market_id,
            market_class,
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
            open_date_key,
            closed_date_key,
            record_start_date,
            record_end_date,
            record_end_date is null as is_current_record
        from call_center
    )
select *
from final
