with
    source as (select * from {{ source("tpcds", "web_site") }}),
    renamed as (
        select
            web_site_sk as web_site_key,
            web_site_id as web_site_id,
            web_rec_start_date as record_start_date,
            web_rec_end_date as record_end_date,
            web_name as name,
            web_open_date_sk as open_date_key,
            web_close_date_sk as close_date_key,
            web_class as class,
            web_manager as manager,
            web_mkt_id as market_id,
            web_mkt_class as market_class,
            web_mkt_desc as market_description,
            web_market_manager as market_manager,
            web_company_id as company_id,
            web_company_name as company_name,
            web_street_number as street_number,
            web_street_name as street_name,
            web_street_type as street_type,
            web_suite_number as suite_number,
            web_city as city,
            web_county as county,
            web_state as state,
            web_zip as zip_code,
            web_country as country,
            web_gmt_offset as gmt_offset,
            web_tax_percentage as tax_percentage
        from source
    )
select *
from renamed
