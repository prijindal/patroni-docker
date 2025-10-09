ARG PG_MAJOR=18

FROM postgres:$PG_MAJOR

ENV PGDATA=/data

RUN apt-get update \
 && apt-get install -y python3-pip python3-psycopg2 python3-etcd patroni pgbackrest \
 && mkdir -p "$PGDATA" \
 && chmod -R 700 "$PGDATA" \
 && chown postgres:postgres "$PGDATA"

USER postgres

CMD ["patroni", "/postgres.yml"]
