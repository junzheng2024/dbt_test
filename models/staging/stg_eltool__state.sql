with source as (
    select *
    from {{ source('raw_layer', 'state') }}
),

renamed as (
    select
        state_id,
        state_code,
        state_name,
		{{ state_append('state_code') }} as state_append_str
    from source
)

select *
from renamed