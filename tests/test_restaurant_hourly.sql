{% set columns_to_compare = '
    identifier::string
    , name::string
    , nb_ordered::number
    , global_turnover:number
    , global_profit:number
    , hour::timestamp' 
%}

{{ is_same_table('restaurant_hourly', 'expect_restaurant_hourly', columns_to_compare) }} 
