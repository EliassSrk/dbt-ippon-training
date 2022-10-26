SELECT
    IDENTIFIER,
    NAME,
    ADDRESS
FROM
    {{ source('sources', 'restaurants') }}
