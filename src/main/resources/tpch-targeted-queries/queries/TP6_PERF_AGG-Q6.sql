---- QUERY: PERF_AGG-Q6
-- The planner should recognize that only c1 and c2 are being materialized from
-- the inline-view. This will provide a significant performance improvement on
-- Parquet format tables.
SELECT v1.c1, v1.c2
FROM (SELECT
sum(l_orderkey) as c1,
sum(l_partkey) as c2,
sum(l_suppkey) as c3,
sum(l_linenumber) as c4,
sum(l_quantity) as c5,
sum(l_extendedprice) as c6,
sum(l_discount) as c7,
sum(l_tax) as c8 FROM lineitem
) v1
