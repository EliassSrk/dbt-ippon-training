select 
    d.identifier
    , date_trunc('hour',to_timestamp(odf.created_at))      as hour
    , d.name
    , count(*)                                             as nb_ordered
    , sum(d.selling_price)                                 as global_turnover
    , sum(d.production_cost)                               as global_profit
from 
    {{ref('stg_orders__dishes_flattened')}}   as odf
left join 
    {{ref('base_dishes')}} as d
        on odf.dish_id = d.identifier
group by 1,2,3