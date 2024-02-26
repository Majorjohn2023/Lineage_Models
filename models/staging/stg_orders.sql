-- models/staging/stg_orders.sql
WITH source AS (
    SELECT * FROM {{ source('tpch', 'orders') }}
)
SELECT
    o_orderkey,
    o_custkey,
    o_orderstatus,
    o_totalprice,
    o_orderdate,
    o_orderpriority,
    o_clerk,
    o_shippriority,
    o_comment
FROM source
