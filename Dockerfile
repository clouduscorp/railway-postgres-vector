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

# 데이터 디렉토리 생성
VOLUME ["/var/lib/postgresql/data"]

# 기본 데이터베이스 초기화 스크립트 추가
COPY ./init.sql /docker-entrypoint-initdb.d/

# PostgreSQL 설정 파일 복사 (필요한 경우)
# COPY postgresql.conf /etc/postgresql/postgresql.conf