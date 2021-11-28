FROM hadoop-base:latest
LABEL creator="MarcLamberti"
LABEL maintainer="lkellermann"

COPY start-nodemanager.sh start-nodemanager.sh

RUN chmod +x start-nodemanager.sh

EXPOSE 8042

CMD [ "./start-nodemanager.sh" ]