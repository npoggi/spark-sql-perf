---- QUERY: primitive_groupby_bigint_highndv
-- Description : Scan fact table and do a group by on a column with High NDV.
-- Target test case : Hash aggregation with large number of buckets.
SELECT l_orderkey,
count(*) AS cnt
FROM lineitem
GROUP BY l_orderkey
HAVING count(*) > 9999999999999;
