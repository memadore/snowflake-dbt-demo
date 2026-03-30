with
    source as (select * from {{ source("tpcds", "catalog_returns") }}),
    renamed as (
        select
            {{ dbt_utils.generate_surrogate_key(["cr_item_sk", "cr_order_number"]) }}
            as catalog_return_key,
            cr_returned_date_sk as returned_date_key,
            cr_returned_time_sk as returned_time_key,
            cr_item_sk as item_key,
            cr_refunded_customer_sk as refunded_customer_key,
            cr_refunded_cdemo_sk as refunded_customer_demographics_key,
            cr_refunded_hdemo_sk as refunded_household_demographics_key,
            cr_refunded_addr_sk as refunded_address_key,
            cr_returning_customer_sk as returning_customer_key,
            cr_returning_cdemo_sk as returning_customer_demographics_key,
            cr_returning_hdemo_sk as returning_household_demographics_key,
            cr_returning_addr_sk as returning_address_key,
            cr_call_center_sk as call_center_key,
            cr_catalog_page_sk as catalog_page_key,
            cr_ship_mode_sk as ship_mode_key,
            cr_warehouse_sk as warehouse_key,
            cr_reason_sk as reason_key,
            cr_order_number as order_number,
            cr_return_quantity as return_quantity,
            cr_return_amount as return_amount,
            cr_return_tax as return_tax,
            cr_return_amt_inc_tax as return_amount_including_tax,
            cr_fee as fee,
            cr_return_ship_cost as return_ship_cost,
            cr_refunded_cash as refunded_cash,
            cr_reversed_charge as reversed_charge,
            cr_store_credit as store_credit,
            cr_net_loss as net_loss
        from source
    )
select *
from renamed
