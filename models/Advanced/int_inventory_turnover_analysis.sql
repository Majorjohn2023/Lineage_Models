WITH inventory_activity AS (
    SELECT
        p_partkey,
        SUM(l_quantity) AS total_sold,
        AVG(ps_availqty) AS average_inventory
    FROM {{ ref('stg_lineitem') }} l
    JOIN {{ ref('stg_partsupp') }} ps ON l.l_partkey = ps.ps_partkey
    GROUP BY p_partkey
),
inventory_turnover AS (
    SELECT
        p_partkey,
        total_sold,
        average_inventory,
        CASE WHEN average_inventory > 0 THEN total_sold / average_inventory ELSE NULL END AS turnover_rate
    FROM inventory_activity
)
SELECT * FROM inventory_turnover