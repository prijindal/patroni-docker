ARG PG_MAJOR=18

FROM postgres:$PG_MAJOR

ENV PGDATA=/data

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    curl \
    python3-psycopg2 \
    python3-etcd \
    patroni \
    pgbackrest \
 && mkdir -p "$PGDATA" \
 && chmod -R 700 "$PGDATA" \
 && chown postgres:postgres "$PGDATA"\
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/archives/*.deb

USER postgres

CMD ["patroni", "/postgres.yml"]
