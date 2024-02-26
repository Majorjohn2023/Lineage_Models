WITH order_fulfilment AS (
    SELECT
        o_orderkey,
        EXTRACT(EPOCH FROM (MIN(l_receiptdate) - o_orderdate)) / 86400 AS days_to_fulfil
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_lineitem') }} l ON o.o_orderkey = l.l_orderkey
    GROUP BY o_orderkey
)
SELECT * FROM order_fulfilment