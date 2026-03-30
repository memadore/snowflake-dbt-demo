with
    store_sales as (select * from {{ ref("stg_tpcds_store_sales") }}),
    final as (
        select
            store_sale_key,
            sold_date_key,
            sold_time_key,
            item_key,
            customer_key,
            customer_demographics_key,
            household_demographics_key,
            address_key,
            store_key,
            promotion_key,
            ticket_number,
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
            net_paid,
            net_paid_including_tax,
            net_profit
        from store_sales
    )
select *
from final
