---- QUERY: primitive_conjunct_ordering_4
-- Description: Based on TPCDS-Q41
SELECT p_mfgr, count(*) as item_cnt
FROM part
WHERE ((p_type LIKE '%STEEL%'
AND p_size BETWEEN 10 AND 40
AND p_container IN ('LG BOX', 'LG BAG', 'LG CASE'))
OR (p_type LIKE '%COPPER%'
AND p_size BETWEEN 20 AND 50
AND p_container IN ('JUMBO BOX', 'JUMBO BAG', 'JUMBO CASE'))
OR (p_type LIKE '%TIN%'
AND p_size BETWEEN 0 AND 30
AND p_container IN ('MED BOX', 'MED BAG', 'MED CASE'))
OR (p_type LIKE '%BRASS%'
AND p_size BETWEEN 0 AND 20
AND p_container IN ('SMALL BOX', 'SMALL BAG', 'SMALL CASE')))
AND p_partkey = -1
GROUP BY p_mfgr
