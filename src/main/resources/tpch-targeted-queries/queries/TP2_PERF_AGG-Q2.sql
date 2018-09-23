---- QUERY: PERF_AGG-Q2
-- Group by l_shipmode - 7 groups
SELECT l_shipmode, count(*)
FROM lineitem
GROUP BY l_shipmode
