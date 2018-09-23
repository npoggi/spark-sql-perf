---- QUERY: primitive_filter_bigint_selective
-- Description : Scan fact table while applying selective filter on bigint column.
-- Target test case : Basic scan and filter.
SELECT count(*)
FROM lineitem
WHERE l_orderkey < 20;
