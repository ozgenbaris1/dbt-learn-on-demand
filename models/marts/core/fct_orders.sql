with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

final as (
    select 
        order_id,
        o.customer_id,
        p.amount
    from orders o
    left join payments p
    using(order_id)
)

select * from final