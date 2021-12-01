#!/bin/bash

# Created by MarcLamberti
# Maintained by lkellermann

set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  DROP DATABASE IF EXISTS metastore;
  DROP ROLE IF EXISTS hive;
  CREATE USER hive WITH PASSWORD 'hive';
  CREATE DATABASE metastore;
  GRANT ALL PRIVILEGES ON DATABASE metastore TO hive;
  \c metastore
  \i /tmp/grant-privs
EOSQL
