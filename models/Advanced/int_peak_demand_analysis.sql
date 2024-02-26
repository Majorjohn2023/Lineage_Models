WITH monthly_demand AS (
    SELECT
        DATE_TRUNC('month', l_shipdate) AS month,
        COUNT(*) AS total_orders,
        SUM(l_quantity) AS total_quantity
    FROM {{ ref('stg_lineitem') }}
    GROUP BY month
),
peak_demand AS (
    SELECT
        month,
        total_orders,
        total_quantity,
        RANK() OVER (ORDER BY total_quantity DESC) AS demand_rank
    FROM monthly_demand
)
SELECT * FROM peak_demand;
