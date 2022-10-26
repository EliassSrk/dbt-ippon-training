SELECT
    NAME,
    ADDRESS,
    TOTAL_AMOUNT
FROM
    {{ ref('stg_rank_restaurant') }}

LIMIT 3
    --{{ var('nb_restaurants') }}
