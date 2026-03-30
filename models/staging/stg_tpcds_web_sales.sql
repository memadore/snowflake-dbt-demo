with
    source as (select * from {{ source("tpcds", "web_sales") }}),
    renamed as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    ["'web'", "ws_item_sk", "ws_order_number"]
                )
            }} as web_sale_key,
            ws_sold_date_sk as sold_date_key,
            ws_sold_time_sk as sold_time_key,
            ws_ship_date_sk as ship_date_key,
            ws_item_sk as item_key,
            ws_bill_customer_sk as bill_customer_key,
            ws_bill_cdemo_sk as bill_customer_demographics_key,
            ws_bill_hdemo_sk as bill_household_demographics_key,
            ws_bill_addr_sk as bill_address_key,
            ws_ship_customer_sk as ship_customer_key,
            ws_ship_cdemo_sk as ship_customer_demographics_key,
            ws_ship_hdemo_sk as ship_household_demographics_key,
            ws_ship_addr_sk as ship_address_key,
            ws_web_page_sk as web_page_key,
            ws_web_site_sk as web_site_key,
            ws_ship_mode_sk as ship_mode_key,
            ws_warehouse_sk as warehouse_key,
            ws_promo_sk as promotion_key,
            ws_order_number as order_number,
            ws_quantity as quantity,
            ws_wholesale_cost as wholesale_cost,
            ws_list_price as list_price,
            ws_sales_price as sales_price,
            ws_ext_discount_amt as extended_discount_amount,
            ws_ext_sales_price as extended_sales_price,
            ws_ext_wholesale_cost as extended_wholesale_cost,
            ws_ext_list_price as extended_list_price,
            ws_ext_tax as extended_tax,
            ws_coupon_amt as coupon_amount,
            ws_ext_ship_cost as extended_ship_cost,
            ws_net_paid as net_paid,
            ws_net_paid_inc_tax as net_paid_including_tax,
            ws_net_paid_inc_ship as net_paid_including_ship,
            ws_net_paid_inc_ship_tax as net_paid_including_ship_tax,
            ws_net_profit as net_profit
        from source
    )
select *
from renamed
