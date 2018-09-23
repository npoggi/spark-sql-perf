#!/usr/bin/env bash

# Splits test files containing multiple queries into multiple files
# also removes unused type and results extra info

save_query() {
  local file_name="$1"
  local file_contents="$2"
  echo -e "Saving query: $file_name"
  echo -e "$file_contents" > "queries/$file_name.sql"
}

query_number=0
for file in source_tests/*.test; do
  echo "Iterating: $file"
  new_query=
  query_name=
  while read line; do
    #echo "line $line"
    if [[ "$line" == '---- QUERY:'* ]]; then
      ((query_number=query_number+1))
      new_query="$line"
      query_name="TP${query_number}_${line##*: }"
    elif [[ "$new_query" && "$line" == '---- '* ]]; then
      save_query "$query_name" "$new_query"
      new_query=
      query_name=
    elif [[ "$new_query" ]]; then
      new_query="$new_query\n$line"
    fi
  done < "$file"
done

if [[ "$new_query" ]]; then
  save_query "$query_name" "$new_query"
fi