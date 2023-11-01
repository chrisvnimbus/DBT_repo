with
    payments as (select * from {{ ref("stg_payments") }}),

    orders as (select * from {{ ref("stg_orders") }}),

    total_amount as (

        select order_id, sum(amount) as amount from payments group by order_id

    ),

    final as (
        select orders.order_id, orders.customer_id, orders.order_date, total_amount.amount

        from orders
        left join total_amount
        using (order_id)

    )

select *
from final
