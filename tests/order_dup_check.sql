with source as (
    select *
    from {{ source('raw_layer', 'orders_test') }}
),

renamed as (
    select
        order_id, count(*) as cnt
    from source
	group by order_id
	having count(*) > 1
)

select *
from renamed