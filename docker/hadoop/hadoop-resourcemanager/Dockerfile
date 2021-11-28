FROM hadoop-base:latest
LABEL creator="MarcLamberti"
LABEL maintainer="lkellermann"

COPY start-resourcemanager.sh start-resourcemanager.sh

RUN chmod +x start-resourcemanager.sh

EXPOSE 8088

CMD [ "./start-resourcemanager.sh" ]