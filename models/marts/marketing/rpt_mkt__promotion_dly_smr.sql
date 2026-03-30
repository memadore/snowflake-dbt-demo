with
    sales as (select * from {{ ref("int_unified_sale") }}),
    promotion_sales as (
        select
            promotion_key,
            sales_channel,
            sold_date_key,
            customer_key,
            customer_demographics_key,
            household_demographics_key,
            item_key,
            sum(quantity) as total_quantity,
            sum(extended_sales_price) as total_sales_revenue,
            sum(extended_wholesale_cost) as total_wholesale_cost,
            sum(extended_list_price) as total_list_price,
            sum(extended_discount_amount) as total_discount_amount,
            sum(coupon_amount) as total_coupon_amount,
            sum(net_paid) as total_net_paid,
            sum(net_paid_including_tax) as total_net_paid_including_tax,
            sum(net_profit) as total_net_profit,
            count(*) as line_item_count
        from sales
        where promotion_key is not null
        group by
            promotion_key,
            sales_channel,
            sold_date_key,
            customer_key,
            customer_demographics_key,
            household_demographics_key,
            item_key
    ),
    final as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    [
                        "promotion_key",
                        "sales_channel",
                        "sold_date_key",
                        "customer_key",
                        "customer_demographics_key",
                        "household_demographics_key",
                        "item_key",
                    ]
                )
            }} as promotion_sale_key,
            promotion_key,
            sales_channel,
            sold_date_key,
            customer_key,
            customer_demographics_key,
            household_demographics_key,
            item_key,
            total_quantity,
            total_sales_revenue,
            total_wholesale_cost,
            total_list_price,
            total_discount_amount,
            total_coupon_amount,
            total_net_paid,
            total_net_paid_including_tax,
            total_net_profit,
            line_item_count
        from promotion_sales
    )
select *
from final
