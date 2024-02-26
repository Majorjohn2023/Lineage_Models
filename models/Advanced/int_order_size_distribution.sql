WITH order_size AS (
    SELECT
        o_orderkey,
        COUNT(*) AS lineitem_count
    FROM {{ ref('stg_lineitem') }}
    GROUP BY o_orderkey
),
order_size_distribution AS (
    SELECT
        lineitem_count,
        COUNT(*) AS order_count
    FROM order_size
    GROUP BY lineitem_count
)
SELECT * FROM order_size_distribution