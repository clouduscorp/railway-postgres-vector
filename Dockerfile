FROM postgres:16

# pgvector 설치
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

# 초기화 스크립트 추가
COPY ./init.sql /docker-entrypoint-initdb.d/