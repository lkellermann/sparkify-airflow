# Base Image
FROM spark-base:latest
LABEL creator="MarcLamberti"
LABEL maintainer="lkellermann"

# Arguments that can be set with docker build
ARG AIRFLOW_VERSION=2.1.0
ARG AIRFLOW_HOME=/opt/airflow

# Export the environment variable AIRFLOW_HOME where airflow will be installed
ENV AIRFLOW_HOME=${AIRFLOW_HOME}

# Install dependencies and tools
RUN apt-get update -y && \
    apt-get upgrade -yqq && \
    apt-get install -yqq --no-install-recommends \
    python3-dev \
    wget \
    libczmq-dev \
    curl \
    libssl-dev \
    git \
    inetutils-telnet \
    bind9utils freetds-dev \
    libkrb5-dev \
    libsasl2-dev \
    libffi-dev libpq-dev \
    freetds-bin build-essential \
    default-libmysqlclient-dev \
    apt-utils \
    rsync \
    zip \
    unzip \
    gcc \
    vim \
    netcat \
    && apt-get autoremove -yqq --purge && apt-get clean

COPY ./requirements-python3.7.txt /requirements-python3.7.txt

# Upgrade pip
# Create airflow user
# Install apache airflow with subpackages
RUN /usr/bin/python3 -m pip install --upgrade pip
RUN adduser --disabled-password airflow #${AIRFLOW_HOME} airflow
RUN pip install apache-airflow==${AIRFLOW_VERSION} --constraint /requirements-python3.7.txt
RUN pip install apache-airflow-providers-apache-hdfs==1.0.1 --constraint /requirements-python3.7.txt
RUN pip install apache-airflow-providers-apache-hive==2.0.3 --constraint /requirements-python3.7.txt
RUN pip install apache-airflow-providers-apache-spark==1.0.2 --constraint /requirements-python3.7.txt
RUN pip install apache-airflow-providers-slack==3.0.0 --constraint /requirements-python3.7.txt
RUN pip install apache-airflow-providers-http==1.1.1 --constraint /requirements-python3.7.txt

# Set the owner of the files in AIRFLOW_HOME to the user airflow
RUN mkdir ${AIRFLOW_HOME}
RUN chown -R airflow ${AIRFLOW_HOME}

# Copy the entrypoint.sh from host to container (at path AIRFLOW_HOME)
COPY ./start-airflow.sh ./start-airflow.sh

# Set the entrypoint.sh file to be executable
RUN chmod +x ./start-airflow.sh

# Set the username to use
USER airflow

# Create the folder dags inside $AIRFLOW_HOME
RUN mkdir -p ${AIRFLOW_HOME}/dags

# Expose ports (just to indicate that this container needs to map port)
EXPOSE 8080

# Execute start-airflow.sh
CMD [ "./start-airflow.sh" ]


