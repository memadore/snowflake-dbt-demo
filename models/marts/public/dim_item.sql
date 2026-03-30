with
    item as (select * from {{ ref("stg_tpcds_item") }}),
    final as (
        select
            item_key,
            item_id,
            product_name,
            item_description,
            brand_id,
            brand,
            class_id,
            class,
            category_id,
            category,
            manufacturer_id,
            manufacturer,
            size,
            formulation,
            color,
            units,
            container,
            current_price,
            wholesale_cost,
            manager_id,
            record_start_date,
            record_end_date,
            record_end_date is null as is_current_record
        from item
    )
select *
from final
