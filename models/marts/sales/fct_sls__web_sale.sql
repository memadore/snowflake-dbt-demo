with
    web_sales as (select * from {{ ref("stg_tpcds_web_sales") }}),
    final as (
        select
            web_sale_key,
            sold_date_key,
            sold_time_key,
            ship_date_key,
            item_key,
            bill_customer_key,
            bill_customer_demographics_key,
            bill_household_demographics_key,
            bill_address_key,
            ship_customer_key,
            ship_customer_demographics_key,
            ship_household_demographics_key,
            ship_address_key,
            web_page_key,
            web_site_key,
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
            net_paid_including_ship_tax,
            net_profit
        from web_sales
    )
select *
from final
