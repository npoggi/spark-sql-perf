---- QUERY: PERF_STRING-Q7
-- Make sure we free local expr allocations
SELECT count(*) FROM lineitem
WHERE lower(l_comment) =     'egular courts above the'
