SELECT
    IDENTIFIER,
    NAME,
    SELLING_PRICE,
    PRODUCTION_COST,
    TYPE
FROM
    {{ mockable_source('sources', 'dishes','sample_dishes') }}
