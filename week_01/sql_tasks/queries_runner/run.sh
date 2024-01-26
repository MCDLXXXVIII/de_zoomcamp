#!/bin/sh

echo "Waiting for data preparation to complete..."
while [ ! -f /sync/data_ready ]; do
  sleep 5
done
echo "Data preparation complete. Proceeding with PostgreSQL operations."

export PGPASSWORD="$POSTGRES_PASSWORD"

SQL_DIR="./tasks"
for i in $(seq 3 6); do
    sql_file="${SQL_DIR}/${i}.sql"

    if [[ -f "$sql_file" ]]; then
        output=$(psql -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$sql_file" --no-align --tuples-only)
        echo "Output for Task $i: $output"
    else
        echo "Task file ${i}.sql does not exist."
    fi
done
