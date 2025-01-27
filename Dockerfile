FROM postgres:16

RUN apt-get update \
    && apt-get install -y \
        postgresql-server-dev-16 \
        gcc \
        make \
        git \
    && git clone https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install
