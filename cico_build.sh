#!/bin/bash

set -e

yum -y install docker 
service docker start

(
    cd grafana-hawkular
    docker build -t registry.devshift.net/perf/osd-monitor:latest . 
    docker push registry.devshift.net/perf/osd-monitor:latest
)
(
    cd pcp-node-collector
    docker build -t registry.devshift.net/perf/pcp-node-collector:latest . 
    docker push registry.devshift.net/perf/pcp-node-collector:latest
)
(
    cd pcp-central-logger
    docker build -t registry.devshift.net/perf/pcp-central-logger:latest . 
    docker push registry.devshift.net/perf/pcp-central-logger:latest
)
