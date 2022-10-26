select
   O.IDENTIFIER,
   O.RESTAURANT_IDENTIFIER,
   O.AMOUNT,
   O.PAYMENT_METHOD,
   O.CREATED_AT,
   O.DISHES_IDS,
   D.value                                                         AS DISH_ID
from                                 
    {{ ref('stg_orders') }}                                        AS O 
, table(flatten(input => parse_json(o.dishes_ids), outer => true)) AS D