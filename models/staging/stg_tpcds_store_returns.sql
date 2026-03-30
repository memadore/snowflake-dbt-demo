with
    source as (select * from {{ source("tpcds", "store_returns") }}),
    renamed as (
        select
            {{ dbt_utils.generate_surrogate_key(["sr_item_sk", "sr_ticket_number"]) }}
            as store_return_key,
            sr_returned_date_sk as returned_date_key,
            sr_return_time_sk as return_time_key,
            sr_item_sk as item_key,
            sr_customer_sk as customer_key,
            sr_cdemo_sk as customer_demographics_key,
            sr_hdemo_sk as household_demographics_key,
            sr_addr_sk as address_key,
            sr_store_sk as store_key,
            sr_reason_sk as reason_key,
            sr_ticket_number as ticket_number,
            sr_return_quantity as return_quantity,
            sr_return_amt as return_amount,
            sr_return_tax as return_tax,
            sr_return_amt_inc_tax as return_amount_including_tax,
            sr_fee as fee,
            sr_return_ship_cost as return_ship_cost,
            sr_refunded_cash as refunded_cash,
            sr_reversed_charge as reversed_charge,
            sr_store_credit as store_credit,
            sr_net_loss as net_loss
        from source
    )
select *
from renamed
