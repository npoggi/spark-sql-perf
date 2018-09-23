---- QUERY: primitive_filter_decimal_selective
-- Description : Scan fact table while applying selective filter on decimal column.
-- Target test case : Basic scan and filter.
SELECT count(*)
FROM lineitem
WHERE l_extendedprice < 904.00;
