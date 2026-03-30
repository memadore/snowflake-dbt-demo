with unified_sales as (select * from {{ ref("int_unified_sale") }})
select *
from unified_sales
