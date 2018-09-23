---- QUERY: primitive_broadcast_join_3
-- Description : Selective broadcast joins between lineitem, supplier, part and orders.
-- Target test case : More complex BI query involving a large broadcast with orders,
--   the planner currently create a left deep tree where it should be creating
--   orders x ((lineitem x supplier) x part).
SELECT /* +straight_join */ count(*)
FROM lineitem
JOIN /* +broadcast */ supplier ON l_suppkey = s_suppkey
JOIN /* +broadcast */ part ON l_partkey = p_partkey
JOIN /* +broadcast */ orders ON l_orderkey = o_orderkey
WHERE s_name='Supplier#001880004'
AND p_brand < 'Brand#30'
AND o_orderdate < '1994-01-01';
