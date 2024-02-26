WITH order_fulfillment AS (
    SELECT
        o_orderkey,
        DATEDIFF(day, o_orderdate, MIN(l_receiptdate)) AS days_to_fulfill
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_lineitem') }} l ON o.o_orderkey = l.l_orderkey
    GROUP BY o_orderkey
)
SELECT * FROM order_fulfillment