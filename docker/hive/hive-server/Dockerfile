FROM hive-base:latest
ARG CSV2HDP=/opt/csv2hdp/src
ARG STAGING_CSV=opt/csv2hdp/staging

COPY startup.sh .

RUN echo "export PATH=$PATH:$CSV2HDP:$STAGING_CSV" >> ~/.bashrc

RUN chmod +x startup.sh

CMD [ "./startup.sh" ]