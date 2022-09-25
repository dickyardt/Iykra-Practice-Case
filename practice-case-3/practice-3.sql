WITH cte AS(
  SELECT DISTINCT * FROM `data-to-insights.ecommerce.rev_transactions` -- Remove duplicate values
),
cte1 AS(
  SELECT cte.channelGrouping, PARSE_DATE("%Y%m%d", cte.date) AS date, cte.geoNetwork_country, SUM(cte.totals_transactions) as total
  FROM cte
  GROUP BY cte.channelGrouping, cte.date, cte.geoNetwork_country
)
 
SELECT channelGrouping, geoNetwork_country AS country, ARRAY_AGG(STRUCT(date, total)) AS transaction
FROM cte1
GROUP BY channelGrouping, country