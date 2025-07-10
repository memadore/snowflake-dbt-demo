with
    regions as (select * from {{ ref("stg_tpch_regions") }}),
    final as (select region_key, name, comment from regions)
select *
from final
