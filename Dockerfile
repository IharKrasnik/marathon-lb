FROM debian

ENTRYPOINT [ "/marathon-lb/run" ]
CMD        [ "sse", "--health-check", "--group", "external" ]
EXPOSE     80 81 443 9090 9091

COPY  . /marathon-lb

VOLUME ["/marathon-lb/templates"]

RUN apt-get update && apt-get install -y python3 python3-pip haproxy openssl runit \
    && pip3 install -r /marathon-lb/requirements.txt \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /marathon-lb
