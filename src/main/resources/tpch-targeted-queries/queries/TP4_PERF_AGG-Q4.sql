---- QUERY: PERF_AGG-Q4
-- This is interesting for looking at partitioned aggregation.
-- Ideally, we would like to have a column with more distinct values
-- but there are intermittent slow downs. l_suppkey is good enough
-- for now.
SELECT l_suppkey, count(*) as cnt
FROM lineitem
GROUP BY l_suppkey
ORDER BY l_suppkey, cnt
LIMIT 10
