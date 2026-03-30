with
    source as (select * from {{ source("tpcds", "store_sales") }}),
    renamed as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    ["'store'", "ss_item_sk", "ss_ticket_number"]
                )
            }} as store_sale_key,
            ss_sold_date_sk as sold_date_key,
            ss_sold_time_sk as sold_time_key,
            ss_item_sk as item_key,
            ss_customer_sk as customer_key,
            ss_cdemo_sk as customer_demographics_key,
            ss_hdemo_sk as household_demographics_key,
            ss_addr_sk as address_key,
            ss_store_sk as store_key,
            ss_promo_sk as promotion_key,
            ss_ticket_number as ticket_number,
            ss_quantity as quantity,
            ss_wholesale_cost as wholesale_cost,
            ss_list_price as list_price,
            ss_sales_price as sales_price,
            ss_ext_discount_amt as extended_discount_amount,
            ss_ext_sales_price as extended_sales_price,
            ss_ext_wholesale_cost as extended_wholesale_cost,
            ss_ext_list_price as extended_list_price,
            ss_ext_tax as extended_tax,
            ss_coupon_amt as coupon_amount,
            ss_net_paid as net_paid,
            ss_net_paid_inc_tax as net_paid_including_tax,
            ss_net_profit as net_profit
        from source
    )
select *
from renamed
