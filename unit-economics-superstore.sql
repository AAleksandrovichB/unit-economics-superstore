SELECT
    segment
   ,COUNT(segment) AS qty_orders
   ,ROUND(SUM(sales), 2) AS total_sales
   ,ROUND(SUM(profit), 2) AS total_profit
   ,ROUND(SUM(sales) / COUNT(segment), 2) AS AOV
   ,ROUND(SUM(profit) / COUNT(segment), 2) AS APC
   ,ROUND(SUM(profit) / SUM(sales) * 100, 2) AS CM_ratio
   ,ROUND(AVG(discount), 3) AS avg_discount
FROM samplesuperstore
GROUP BY segment
ORDER BY CM_ratio DESC;

