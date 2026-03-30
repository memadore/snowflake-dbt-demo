with
    reason as (select * from {{ ref("stg_tpcds_reason") }}),
    final as (select reason_key, reason_id, reason_description from reason)
select *
from final
