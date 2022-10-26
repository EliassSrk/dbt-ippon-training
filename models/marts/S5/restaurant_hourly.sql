SELECT
    D.IDENTIFIER,
    D.NAME,
    COUNT(*)                                             AS NB_ORDERED,
    SUM(d.selling_price)                                 AS GLOBAL_TURNOVER,
    SUM(d.production_cost)                               AS GLOBAL_PROFIT,
    DATE_TRUNC('hour', to_timestamp(odf.CREATED_AT))     AS HOUR
FROM
    {{ ref('stg_order_dishes') }}                        AS ODF
LEFT JOIN
    {{ ref('stg_dishes') }}                              AS D
    ON ODF.DISH_ID = D.IDENTIFIER

group by
    D.IDENTIFIER,
    D.NAME,
    HOUR
    
limit 3