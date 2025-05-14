select 
    date_trunc(campaigns.date_date, month) as month_date
    ,sum(operational_margin) -sum(ads_cost) as ads_margin
    ,sum(average_basket) as average_basket
    ,sum(operational_margin) as operational_margin
    ,sum(ads_cost) as ads_cost
    ,sum(ads_impression) as ads_impression
    ,sum(ads_click) as ads_clicks
    ,sum(revenue) as revenue
    ,sum(margin) as margin

from {{ ref('int_campaigns_day') }} as campaigns
    join {{ ref('finance_days') }} as finance
        on campaigns.date_date = finance.date_date

group by date_trunc(campaigns.date_date, month)

order by date_trunc(campaigns.date_date, month) desc