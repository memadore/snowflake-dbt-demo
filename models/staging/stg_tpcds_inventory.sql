with
    source as (select * from {{ source("tpcds", "inventory") }}),
    renamed as (
        select
            {{
                dbt_utils.generate_surrogate_key(
                    ["inv_date_sk", "inv_item_sk", "inv_warehouse_sk"]
                )
            }} as inventory_key,
            inv_date_sk as date_key,
            inv_item_sk as item_key,
            inv_warehouse_sk as warehouse_key,
            inv_quantity_on_hand as quantity_on_hand
        from source
    )
select *
from renamed
