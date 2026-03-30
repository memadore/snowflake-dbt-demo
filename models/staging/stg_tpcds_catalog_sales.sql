with
    source as (select * from {{ source("tpcds", "catalog_sales") }}),
    renamed as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    ["'catalog'", "cs_item_sk", "cs_order_number"]
                )
            }} as catalog_sale_key,
            cs_sold_date_sk as sold_date_key,
            cs_sold_time_sk as sold_time_key,
            cs_ship_date_sk as ship_date_key,
            cs_bill_customer_sk as bill_customer_key,
            cs_bill_cdemo_sk as bill_customer_demographics_key,
            cs_bill_hdemo_sk as bill_household_demographics_key,
            cs_bill_addr_sk as bill_address_key,
            cs_ship_customer_sk as ship_customer_key,
            cs_ship_cdemo_sk as ship_customer_demographics_key,
            cs_ship_hdemo_sk as ship_household_demographics_key,
            cs_ship_addr_sk as ship_address_key,
            cs_call_center_sk as call_center_key,
            cs_catalog_page_sk as catalog_page_key,
            cs_ship_mode_sk as ship_mode_key,
            cs_warehouse_sk as warehouse_key,
            cs_item_sk as item_key,
            cs_promo_sk as promotion_key,
            cs_order_number as order_number,
            cs_quantity as quantity,
            cs_wholesale_cost as wholesale_cost,
            cs_list_price as list_price,
            cs_sales_price as sales_price,
            cs_ext_discount_amt as extended_discount_amount,
            cs_ext_sales_price as extended_sales_price,
            cs_ext_wholesale_cost as extended_wholesale_cost,
            cs_ext_list_price as extended_list_price,
            cs_ext_tax as extended_tax,
            cs_coupon_amt as coupon_amount,
            cs_ext_ship_cost as extended_ship_cost,
            cs_net_paid as net_paid,
            cs_net_paid_inc_tax as net_paid_including_tax,
            cs_net_paid_inc_ship as net_paid_including_ship,
            cs_net_paid_inc_ship_tax as net_paid_including_ship_and_tax,
            cs_net_profit as net_profit
        from source
    )
select *
from renamed
