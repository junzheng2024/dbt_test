with source as (
    select *
    from {{ source('raw_layer', 'orders') }}
),

order_src as (
    select
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp,
        order_approved_at,
        order_delivered_carrier_date,
        order_delivered_customer_date,
        order_estimated_delivery_date
    from source
)

,tgt as (
    select *
    from {{ source('raw_layer', 'orders_test') }}
),

order_tgt as (
    select
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp,
        order_approved_at,
        order_delivered_carrier_date,
        order_delivered_customer_date,
        order_estimated_delivery_date
    from tgt
)

(select * from order_src 
except 
select * from order_tgt
)
union 
(
select * from order_tgt 
except 
select * from order_src    
)