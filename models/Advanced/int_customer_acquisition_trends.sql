WITH customer_acquisition AS (
    SELECT
        DATE_PART('year', c_creationdate) AS year,
        COUNT(*) AS new_customers
    FROM {{ ref('stg_customers') }}
    GROUP BY DATE_PART('year', c_creationdate)
)
SELECT * FROM customer_acquisition
