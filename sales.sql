WITH cte AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)
SELECT 
date,
season,
cte.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders*price as revenue,
riders*price-COGS as profit
FROM cte
LEFT JOIN cost_table AS c
ON cte.yr = c.yr;
