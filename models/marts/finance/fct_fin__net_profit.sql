with
    sales as (select * from {{ ref("int_unified_sale") }}),
    final as (
        select
            sale_key,
            sales_channel,
            sold_date_key,
            item_key,
            customer_key,
            store_key,
            web_page_key,
            web_site_key,
            call_center_key,
            catalog_page_key,
            promotion_key,
            order_number,
            quantity,
            wholesale_cost,
            list_price,
            sales_price,
            extended_sales_price,
            extended_wholesale_cost,
            extended_discount_amount,
            coupon_amount,
            extended_tax,
            extended_ship_cost,
            net_paid,
            net_paid_including_tax,
            net_paid_including_ship,
            net_paid_including_ship_and_tax,
            net_profit,
            extended_sales_price - extended_wholesale_cost as gross_margin,
            extended_sales_price
            - extended_wholesale_cost
            - extended_discount_amount
            - coupon_amount as gross_margin_after_discounts
        from sales
    )
select *
from final
