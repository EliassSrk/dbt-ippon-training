{%- set payment_methods = dbt_utils.get_column_values(    
table=source('sources','orders')    
    , column='payment_method') -%}


SELECT
    R.NAME, 
    
    {%- for payment_method in payment_methods %}
        SUM(CASE WHEN PAYMENT_METHOD = '{{ payment_method }}' THEN AMOUNT END)    AS {{ payment_method }}_AMOUNT
        {%- if not loop.last %},{% endif -%}
    {% endfor %}

FROM
    {{ ref('stg_restaurant') }}   AS R
LEFT JOIN
    {{ ref('stg_orders') }}       AS O
    ON O.RESTAURANT_IDENTIFIER = R.IDENTIFIER
GROUP BY
    R.NAME
    