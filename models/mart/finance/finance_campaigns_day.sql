select 
    campaigns.date_date as date_date
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

group by campaigns.date_date

order by campaigns.date_date desc