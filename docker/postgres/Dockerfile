FROM postgres:14.1-alpine

COPY init-hive-db.sh /docker-entrypoint-initdb.d/init-hive-db.sh
COPY grant-privs /tmp/grant-privs

RUN chmod +x /docker-entrypoint-initdb.d/init-hive-db.sh
RUN chmod +x /tmp/grant-privs

EXPOSE 5432
