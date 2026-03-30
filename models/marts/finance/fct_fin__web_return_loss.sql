with
    web_returns as (select * from {{ ref("stg_tpcds_web_returns") }}),
    final as (
        select
            web_return_key,
            returned_date_key,
            item_key,
            refunded_customer_key,
            returning_customer_key,
            web_page_key,
            reason_key,
            order_number,
            return_quantity,
            return_amount,
            return_tax,
            return_amount_including_tax,
            fee,
            return_ship_cost,
            refunded_cash,
            reversed_charge,
            account_credit,
            net_loss
        from web_returns
    )
select *
from final
