with
    source as (select * from {{ source("tpcds", "web_returns") }}),
    renamed as (
        select
            {{ dbt_utils.generate_surrogate_key(["wr_item_sk", "wr_order_number"]) }}
            as web_return_key,
            wr_returned_date_sk as returned_date_key,
            wr_returned_time_sk as returned_time_key,
            wr_item_sk as item_key,
            wr_refunded_customer_sk as refunded_customer_key,
            wr_refunded_cdemo_sk as refunded_customer_demographics_key,
            wr_refunded_hdemo_sk as refunded_household_demographics_key,
            wr_refunded_addr_sk as refunded_address_key,
            wr_returning_customer_sk as returning_customer_key,
            wr_returning_cdemo_sk as returning_customer_demographics_key,
            wr_returning_hdemo_sk as returning_household_demographics_key,
            wr_returning_addr_sk as returning_address_key,
            wr_web_page_sk as web_page_key,
            wr_reason_sk as reason_key,
            wr_order_number as order_number,
            wr_return_quantity as return_quantity,
            wr_return_amt as return_amount,
            wr_return_tax as return_tax,
            wr_return_amt_inc_tax as return_amount_including_tax,
            wr_fee as fee,
            wr_return_ship_cost as return_ship_cost,
            wr_refunded_cash as refunded_cash,
            wr_reversed_charge as reversed_charge,
            wr_account_credit as account_credit,
            wr_net_loss as net_loss
        from source
    )
select *
from renamed
