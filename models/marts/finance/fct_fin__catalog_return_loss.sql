with
    catalog_returns as (select * from {{ ref("stg_tpcds_catalog_returns") }}),
    final as (
        select
            catalog_return_key,
            returned_date_key,
            item_key,
            refunded_customer_key,
            returning_customer_key,
            call_center_key,
            catalog_page_key,
            ship_mode_key,
            warehouse_key,
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
            store_credit,
            net_loss
        from catalog_returns
    )
select *
from final
