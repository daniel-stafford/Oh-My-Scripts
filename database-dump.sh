#!/bin/bash
set -e

set -a
source .env
set +a

echo "Getting the remote dump (may take 30 seconds or so 😤)..."
PGPASSWORD=$DB_REMOTE_PASSWORD pg_dump \
  -p $DB_REMOTE_PORT \
  -h $DB_REMOTE_HOST \
  -U $DB_REMOTE_USERNAME \
  $db_name > /tmp/${d_name}.sql

read -p " ✋ WARNING: This will erase all data on your localhost. Do you want to continue? [y/n] " answer
[[ $answer != y ]] && echo "Aborted!" && exit 1


echo "🔪 Dropping local database..."
PGPASSWORD=${POSTGRES_PASSWORD} dropdb \
  -h $POSTGRES_HOST \
  -p $POSTGRES_PORT \
  -U $POSTGRES_USERNAME \
  --if-exists \
  $POSTGRES_DATABASE

echo "🍲 Creating a fresh database..."
PGPASSWORD=$POSTGRES_PASSWORD createdb \
  -h $POSTGRES_HOST \
  -p $POSTGRES_PORT \
  -U $POSTGRES_USERNAME \
  $POSTGRES_DATABASE

echo "💪 Applying the database dump to local database..."
PGPASSWORD=$POSTGRES_PASSWORD psql \
  -h $POSTGRES_HOST \
  -p $POSTGRES_PORT \
  -U $POSTGRES_USERNAME \
  $POSTGRES_DATABASE < /tmp/${POSTGRES_DATABASE}.sql

echo "🎉 Success! You now have a local copy of the remote database!"
echo "👀 Use psql, pgcli, tableplus, etc. to view your databse:"
echo "e.g. psql -h ${POSTGRES_HOST} -p ${POSTGRES_PORT} -U ${POSTGRES_USERNAME} ${POSTGRES_DATABASE}"