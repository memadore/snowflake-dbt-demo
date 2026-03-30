with
    ship_mode as (select * from {{ ref("stg_tpcds_ship_mode") }}),
    final as (
        select ship_mode_key, ship_mode_id, type, code, carrier, contract from ship_mode
    )
select *
from final
