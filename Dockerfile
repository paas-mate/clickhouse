FROM shoothzj/base

WORKDIR /opt

RUN mkdir -p /opt/clickhouse/common-static && \
mkdir -p /opt/clickhouse/client && \
mkdir -p /opt/clickhouse/server && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v22.9.7.34-stable/clickhouse-common-static-22.9.7.34.tgz && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v22.9.7.34-stable/clickhouse-client-22.9.7.34.tgz && \
curl -OL https://github.com/ClickHouse/ClickHouse/releases/download/v22.9.7.34-stable/clickhouse-server-22.9.7.34.tgz && \
tar -xf clickhouse-common-static-22.9.7.34.tgz -C /opt/clickhouse/common-static --strip-components 2 && \
/opt/clickhouse/common-static/install/doinst.sh && \
tar -xf clickhouse-client-22.9.7.34.tgz -C /opt/clickhouse/client --strip-components 2 && \
/opt/clickhouse/client/install/doinst.sh && \
tar -xf clickhouse-server-22.9.7.34.tgz -C /opt/clickhouse/server --strip-components 2 && \
/opt/clickhouse/server/install/doinst.sh && \
rm -rf clickhouse-common-static-22.9.7.34.tgz && \
rm -rf clickhouse-client-22.9.7.34.tgz && \
rm -rf clickhouse-server-22.9.7.34.tgz && \
chown -R clickhouse:clickhouse /opt/clickhouse && \
chown -R clickhouse:clickhouse /etc/clickhouse-server && \
chown -R clickhouse:clickhouse /etc/clickhouse-client

WORKDIR /opt/clickhouse

USER clickhouse
