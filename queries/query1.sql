SELECT c.c_name, c.c_mktsegment, t.prettyMonthYear, SUM(uv.adRevenue)
FROM clickstream.uservisits_csv10 as uv
RIGHT OUTER JOIN 
customer as c 
ON c.c_custkey = uv.custKey
INNER JOIN 
(SELECT DISTINCT d_yearmonthnum, (d_month||','||d_year) as prettyMonthYear 
FROM dwdate WHERE d_yearmonthnum >= 199810) as t
ON uv.yearMonthKey = t.d_yearmonthnum
WHERE c.c_custkey <= 3
GROUP BY c.c_name, c.c_mktsegment, t.prettyMonthYear, uv.yearMonthKey 
ORDER BY c.c_name, c.c_mktsegment, uv.yearMonthKey  ASC;
