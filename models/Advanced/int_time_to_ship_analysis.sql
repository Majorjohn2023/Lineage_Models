WITH time_to_ship AS (
    SELECT
        o_orderkey,
        MIN(l_shipdate) - o_orderdate AS days_to_ship
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_lineitem') }} l ON o.o_orderkey = l.l_orderkey
    GROUP BY o_orderkey
)
SELECT * FROM time_to_ship