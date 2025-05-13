select
    orders_id
    ,date_date
    ,sum(revenue) as revenue
    ,sum(quantity) as quantity
    ,sum((quantity * purchase_price)) as purchase_cost
    ,sum((revenue - (quantity * purchase_price))) as margin
from
    {{ref('int_sales_margin')}}
group by 
    orders_id
    ,date_date
order by
    date_date desc
    ,orders_id desc