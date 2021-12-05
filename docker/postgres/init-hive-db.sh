#!/bin/bash

# Created by MarcLamberti
# Maintained by lkellermann

# Note: How to setup a PostgreSQL Metastore:
# https://docs.cloudera.com/cdp-private-cloud-base/7.1.6/hive-metastore/topics/hive-postgres.html
# /opt/hive the Hive Home directory, in the tutorial above the home is /usr/lib/hhive.

set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  DROP DATABASE IF EXISTS metastore;
  DROP ROLE IF EXISTS hive;
  CREATE USER hive WITH PASSWORD 'hive';
  CREATE DATABASE metastore;
  GRANT ALL PRIVILEGES ON DATABASE metastore TO hive;
  \c metastore
  \i /opt/hive/scripts/metastore/upgrade/postgres/hive-schema-3.1.0.postgres.sql
EOSQL
