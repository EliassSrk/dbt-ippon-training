{% set columns_to_compare = '
    NAME::string,
    NB_ORDERED_DAILY_AVG::number,
    GLOBAL_TURNOVER_DAILY_AVG:number,
    GLOBAL_PROFIT_DAILY_AVG:number' 
%}

{{ is_same_table('restaurant_daily', 'expect_restaurant_daily', columns_to_compare) }} 
