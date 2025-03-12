ARG PG_MAJOR=17

FROM postgres:$PG_MAJOR

ENV PGDATA=/var/lib/postgresql/data

WORKDIR /var/lib/postgresql

RUN apt-get update \
 && apt-get install -y python3-pip python3-psycopg2 python3-consul patroni pgbackrest \
 && mkdir -p "$PGDATA" \
 && chmod -R 700 "$PGDATA"

USER postgres

CMD ["patroni", "/postgres.yml"]
