WITH yearly_revenue AS (
    SELECT
        DATE_PART('year', o_orderdate) AS year,
        SUM(o_totalprice) AS total_revenue
    FROM {{ ref('stg_orders') }}
    GROUP BY DATE_PART('year', o_orderdate)
)
SELECT * FROM yearly_revenue