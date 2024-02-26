-- models/staging/stg_supplier.sql
WITH source AS (
    SELECT * FROM {{ source('tpch', 'supplier') }}
)
SELECT
    s_suppkey,
    s_name,
    s_address,
    s_nationkey,
    s_phone,
    s_acctbal,
    s_comment
FROM source
