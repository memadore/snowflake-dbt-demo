with
    promotion as (select * from {{ ref("stg_tpcds_promotion") }}),
    final as (
        select
            promotion_key,
            promotion_id,
            promotion_name,
            start_date_key,
            end_date_key,
            item_key,
            cost,
            response_target,
            channel_direct_mail,
            channel_email,
            channel_catalog,
            channel_tv,
            channel_radio,
            channel_press,
            channel_event,
            channel_demo,
            channel_details,
            purpose,
            is_discount_active
        from promotion
    )
select *
from final
