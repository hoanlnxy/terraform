#!/usr/bin/env bash

#############################################
## Supervisord (start daemons)
#############################################

## Start services
td-agent-gem install fluent-plugin-kinesis
td-agent-gem install aws-sdk-kinesis
td-agent-gem install fluent-plugin-grok-parser
/etc/init.d/td-agent start

exec /opt/docker/bin/service.d/supervisor.sh
