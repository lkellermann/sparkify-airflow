FROM hive-base:latest
ARG CSV2HDP=/opt/csv2hdp/src
ARG STAGING_CSV=/opt/csv2hdp/staging
ARG HIVE_JDBC=jdbc:hive2://localhost:10000

COPY startup.sh .
ENV CSV2HDP="$CSV2HDP"
ENV STAGING_CSV="$STAGING_CSV"
ENV HIVE_JDBC="$HIVE_JDBC"
RUN echo "export PATH=$PATH:$CSV2HDP:$STAGING_CSV" >> ~/.bashrc

RUN chmod +x startup.sh

CMD [ "./startup.sh" ]