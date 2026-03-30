with
    inventory as (select * from {{ ref("stg_tpcds_inventory") }}),
    final as (
        select inventory_key, date_key, item_key, warehouse_key, quantity_on_hand
        from inventory
    )
select *
from final
