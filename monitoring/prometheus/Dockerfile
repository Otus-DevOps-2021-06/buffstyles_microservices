FROM prom/prometheus:v2.1.0

COPY prometheus.yml /etc/prometheus/

WORKDIR /prometheus

ENTRYPOINT ["/bin/prometheus"]
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/prometheus", "--storage.tsdb.retention=1d" ]
