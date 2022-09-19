{{
  config(
    materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key=['identifier','hour']
  )
}}

select 
    d.identifier                                           as identifier
    , d.name                                               as name
    , date_trunc('hour',to_timestamp(odf.created_at))      as hour
    , count(*)                                             as nb_ordered
    , sum(d.selling_price)                                 as global_turnover
    , sum(d.production_cost)                               as global_profit
from 
    {{ref('stg_orders__dishes_flattened')}}   as odf
left join 
    {{ref('base_dishes')}} as d
        on odf.dish_id = d.identifier
group by 1,2,3