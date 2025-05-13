select
    orders_id
    ,date_date
    ,sum(revenue) as revenue
    ,sum(quantity) as quantity
    ,sum((quantity * purchase_price)) as purchase_cost
    ,sum((revenue - (quantity * purchase_price))) as margin
from
    {{ref('stg_raw__sales')}}
    join 
        {{ref('stg_raw__product')}}
        using (products_id)
group by 
    orders_id,
    date_date
order by
    date_date desc,
    orders_id desc