#!/bin/bash

# Docker version
DockerVersion=$(docker -v | cut -d " " -f 3 | tr "," " ");
MysqlVersion=$(mysql --version | cut -d " " -f 4);
TelegrafVersion=$(telegraf --version | cut -d " " -f 2);
GitVersion=$(git --version | cut -d " " -f 3);
NRPEVersion=$(nrpe --version | grep Version | awk -d: '{print $2}');
KernelVersion=$(uname -r | cut -d "-" -f 1);

cat <<EOF
Report for host ${HOSTNAME} run by user ${USER} for $(uname) OS:
Kernel Version: ${KernelVersion}
Docker Version: ${DockerVersion}
MySQL Version: ${MysqlVersion}
Telegraf Version: ${TelegrafVersion}
Git Version: ${GitVersion}
Nagios Report Plugin Version: ${NRPEVersion}
EOF
