with
    source as (select * from {{ source("tpcds", "reason") }}),
    renamed as (
        select
            r_reason_sk as reason_key,
            r_reason_id as reason_id,
            r_reason_desc as reason_description
        from source
    )
select *
from renamed
