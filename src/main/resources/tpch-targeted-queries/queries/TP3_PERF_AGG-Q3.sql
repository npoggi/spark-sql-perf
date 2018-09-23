---- QUERY: PERF_AGG-Q3
-- Group by l_receiptdate ~ 2500 groups
SELECT  l_receiptdate, count(*)
FROM lineitem
GROUP BY l_receiptdate
