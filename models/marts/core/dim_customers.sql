with customers as (
    select *
    from {{ ref('stg_eltool__customers') }}
),

state as (
    select *
    from {{ ref('stg_eltool__state') }}
)

select
    c.customer_id,
    c.zipcode,
    c.city,
    c.state_code,
    s.state_name,
    c.datetime_created,
    c.datetime_updated,
    c.dbt_valid_from as valid_from,
    case
        when c.dbt_valid_to is NULL then STR_TO_DATE('9999-12-31 00:00:00','%Y-%m-%d %H:%i:%s')
        else c.dbt_valid_to
    end as valid_to
from customers as c
inner join state as s on c.state_code = s.state_code