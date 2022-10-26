SELECT
    R.NAME,
    R.ADDRESS,
    SUM(O.AMOUNT)                              AS TOTAL_AMOUNT
FROM
    "DB_EHAJAJOU_DEV"."PUBLIC"."RESTAURANTS"   AS R
LEFT JOIN
    {{ ref('stg_orders') }} AS O
    ON O.RESTAURANT_IDENTIFIER = R.IDENTIFIER
GROUP BY
    R.NAME,
    R.ADDRESS
    