FROM postgres:16

# 필요한 패키지 설치, pgvector 설치, 빌드 도구 제거 및 캐시 정리
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-server-dev-16 \
        gcc \
        make \
        git \
    && git clone https://github.com/pgvector/pgvector.git /tmp/pgvector \
    && cd /tmp/pgvector \
    && make \
    && make install \
    && cd / \
    && rm -rf /tmp/pgvector \
    && apt-get remove --purge -y \
        gcc \
        make \
        git \
        postgresql-server-dev-16 \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
