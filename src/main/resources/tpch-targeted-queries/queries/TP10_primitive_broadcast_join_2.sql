---- QUERY: primitive_broadcast_join_2
-- Description : Selective broadcast joins between lineitem, supplier and part.
-- Target test case : Basic BI query with simple aggregation and two highly selective join,
--   and 99% of lineitem rows are filtered out by the created BitMapFilter.
SELECT /* +straight_join */ count(*)
FROM lineitem
JOIN /* +broadcast */ supplier ON l_suppkey = s_suppkey
JOIN /* +broadcast */ part ON l_partkey = p_partkey
WHERE s_name='Supplier#001880004'
AND p_brand < 'Brand#20';
