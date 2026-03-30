with
    store_sales as (select * from {{ ref("stg_tpcds_store_sales") }}),
    web_sales as (select * from {{ ref("stg_tpcds_web_sales") }}),
    catalog_sales as (select * from {{ ref("stg_tpcds_catalog_sales") }}),

    store_sales_unified as (
        select
            store_sale_key as sale_key,
            'store' as sales_channel,
            sold_date_key,
            sold_time_key,
            cast(null as number) as ship_date_key,
            item_key,
            customer_key,
            customer_demographics_key,
            household_demographics_key,
            address_key,
            cast(null as number) as ship_customer_key,
            cast(null as number) as ship_customer_demographics_key,
            cast(null as number) as ship_household_demographics_key,
            cast(null as number) as ship_address_key,
            store_key,
            cast(null as number) as web_page_key,
            cast(null as number) as web_site_key,
            cast(null as number) as call_center_key,
            cast(null as number) as catalog_page_key,
            cast(null as number) as ship_mode_key,
            cast(null as number) as warehouse_key,
            promotion_key,
            ticket_number as order_number,
            quantity,
            wholesale_cost,
            list_price,
            sales_price,
            extended_discount_amount,
            extended_sales_price,
            extended_wholesale_cost,
            extended_list_price,
            extended_tax,
            coupon_amount,
            cast(null as number) as extended_ship_cost,
            net_paid,
            net_paid_including_tax,
            cast(null as number) as net_paid_including_ship,
            cast(null as number) as net_paid_including_ship_and_tax,
            net_profit
        from store_sales
    ),

    web_sales_unified as (
        select
            web_sale_key as sale_key,
            'web' as sales_channel,
            sold_date_key,
            sold_time_key,
            ship_date_key,
            item_key,
            bill_customer_key as customer_key,
            bill_customer_demographics_key as customer_demographics_key,
            bill_household_demographics_key as household_demographics_key,
            bill_address_key as address_key,
            ship_customer_key,
            ship_customer_demographics_key,
            ship_household_demographics_key,
            ship_address_key,
            cast(null as number) as store_key,
            web_page_key,
            web_site_key,
            cast(null as number) as call_center_key,
            cast(null as number) as catalog_page_key,
            ship_mode_key,
            warehouse_key,
            promotion_key,
            order_number,
            quantity,
            wholesale_cost,
            list_price,
            sales_price,
            extended_discount_amount,
            extended_sales_price,
            extended_wholesale_cost,
            extended_list_price,
            extended_tax,
            coupon_amount,
            extended_ship_cost,
            net_paid,
            net_paid_including_tax,
            net_paid_including_ship,
            net_paid_including_ship_tax as net_paid_including_ship_and_tax,
            net_profit
        from web_sales
    ),

    catalog_sales_unified as (
        select
            catalog_sale_key as sale_key,
            'catalog' as sales_channel,
            sold_date_key,
            sold_time_key,
            ship_date_key,
            item_key,
            bill_customer_key as customer_key,
            bill_customer_demographics_key as customer_demographics_key,
            bill_household_demographics_key as household_demographics_key,
            bill_address_key as address_key,
            ship_customer_key,
            ship_customer_demographics_key,
            ship_household_demographics_key,
            ship_address_key,
            cast(null as number) as store_key,
            cast(null as number) as web_page_key,
            cast(null as number) as web_site_key,
            call_center_key,
            catalog_page_key,
            ship_mode_key,
            warehouse_key,
            promotion_key,
            order_number,
            quantity,
            wholesale_cost,
            list_price,
            sales_price,
            extended_discount_amount,
            extended_sales_price,
            extended_wholesale_cost,
            extended_list_price,
            extended_tax,
            coupon_amount,
            extended_ship_cost,
            net_paid,
            net_paid_including_tax,
            net_paid_including_ship,
            net_paid_including_ship_and_tax,
            net_profit
        from catalog_sales
    ),

    final as (
        select *
        from store_sales_unified
        union all
        select *
        from web_sales_unified
        union all
        select *
        from catalog_sales_unified
    )
select *
from final
