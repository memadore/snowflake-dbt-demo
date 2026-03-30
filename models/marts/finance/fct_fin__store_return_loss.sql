with
    store_returns as (select * from {{ ref("stg_tpcds_store_returns") }}),
    final as (
        select
            store_return_key,
            returned_date_key,
            item_key,
            customer_key,
            store_key,
            reason_key,
            ticket_number,
            return_quantity,
            return_amount,
            return_tax,
            return_amount_including_tax,
            fee,
            return_ship_cost,
            refunded_cash,
            reversed_charge,
            store_credit,
            net_loss
        from store_returns
    )
select *
from final
