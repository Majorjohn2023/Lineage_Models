WITH product_returns AS (
    SELECT
        l_partkey,
        COUNT(*) FILTER (WHERE l_returnflag = 'R') AS return_count,
        COUNT(*) AS total_count
    FROM {{ ref('stg_lineitem') }}
    GROUP BY l_partkey
),
product_return_rate AS (
    SELECT
        l_partkey,
        return_count,
        total_count,
        (return_count::FLOAT / total_count) AS return_rate
    FROM product_returns
)
SELECT * FROM product_return_rate
