with payments as (
    select * from {{ ref('stg_payments') }}
),

final as (
    select sum(amount) from payments
)

select * from final