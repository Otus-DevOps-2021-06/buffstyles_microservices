FROM prom/alertmanager:v0.14.0

COPY config.yml /etc/alertmanager/

ENTRYPOINT [ "/bin/alertmanager" ]
CMD [ "--config.file=/etc/alertmanager/config.yml" ]
