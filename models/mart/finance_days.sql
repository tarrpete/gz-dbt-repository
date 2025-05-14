select
    sales_margin.date_date
    ,count(sales_margin.orders_id) as nb_transactions
    ,sum(sales_margin.revenue) as revenue
    ,sum(sales_margin.revenue) / count (orders_id) as average_basket
    ,sum(sales_margin.margin) as margin
    ,sum(ops_margin.operational_margin) as operational_margin

from
    {{ref('int_sales_margin')}} as sales_margin
    join 
        {{ref('int_orders_operational')}} as ops_margin
        using (orders_id)
group by 
    date_date
order by
    date_date desc
