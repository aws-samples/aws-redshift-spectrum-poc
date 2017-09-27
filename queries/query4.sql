SELECT c.c_name, c.c_mktsegment, t.prettyMonthYear, uv.totalRevenue
FROM
((SELECT customer, visitYearMonth, SUM(adRevenue) as totalRevenue
FROM clickstream.uservisits_parquet1
WHERE customer <= 3 and visitYearMonth >= 199810
GROUP BY  customer, visitYearMonth) as uv
RIGHT OUTER JOIN 
customer as c 
ON c.c_custkey = uv.customer
INNER JOIN 
(SELECT DISTINCT d_yearmonthnum, (d_month||','||d_year) as prettyMonthYear 
FROM dwdate WHERE d_yearmonthnum >= 199810) as t
ON uv.visitYearMonth = t.d_yearmonthnum)
ORDER BY c.c_name, c.c_mktsegment, uv.visitYearMonth ASC;
