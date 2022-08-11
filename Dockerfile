FROM ttbb/base

WORKDIR /opt/sh

RUN mkdir -p /opt/sh/clickhouse/common-static && \
mkdir -p /opt/sh/clickhouse/client && \
mkdir -p /opt/sh/clickhouse/server && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v21.11.6.7-stable/clickhouse-common-static-21.11.6.7.tgz && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v21.11.6.7-stable/clickhouse-client-21.11.6.7.tgz && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v21.11.6.7-stable/clickhouse-server-21.11.6.7.tgz && \
tar -xf clickhouse-common-static-21.11.6.7.tgz -C /opt/sh/clickhouse/common-static --strip-components 2 && \
/opt/sh/clickhouse/common-static/install/doinst.sh && \
tar -xf clickhouse-client-21.11.6.7.tgz -C /opt/sh/clickhouse/client --strip-components 2 && \
/opt/sh/clickhouse/client/install/doinst.sh && \
tar -xf clickhouse-server-21.11.6.7.tgz -C /opt/sh/clickhouse/server --strip-components 2 && \
/opt/sh/clickhouse/server/install/doinst.sh && \
rm -rf clickhouse-common-static-21.11.6.7.tgz && \
rm -rf clickhouse-client-21.11.6.7.tgz && \
rm -rf clickhouse-server-21.11.6.7.tgz && \
chown -R clickhouse:clickhouse /opt/sh/clickhouse && \
chown -R clickhouse:clickhouse /etc/clickhouse-server && \
chown -R clickhouse:clickhouse /etc/clickhouse-client

WORKDIR /opt/sh/clickhouse

USER clickhouse
