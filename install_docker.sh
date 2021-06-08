#!/usr/bin/env bash

function rootUser(){
 if [[ $(id -u) -ne 0 ]]
 then
  echo "non-root user detected, run script as root"
  exit 1
 fi
}

function osRelease(){
 if [[ $(cat /etc/os-release | grep -w ID | cut -d "=" -f 2 | tr '"' ' '  | xargs) != "centos" ]]
 then
  echo "non-centos OS detected, this script runs only on CentOS"
  exit 1
fi
}

function isDockerInstalled(){
 rpm -qa | grep docker-ce-[0-9] > /dev/null
 if [[ $? -eq 0 ]]
 then
  LATEST_VERSION="20.10.2"
  INSTALLED_VERSION=$(docker -v | cut -d " " -f 3 | tr "," " "|xargs)
  if [[ "${INSTALLED_VERSION}" == "${LATEST_VERSION}" ]]
  then
   echo "Latest version already installed..."
   exit 0
  else
   echo "older version detected..."
   exit 1
  fi
 fi
}

function installDocker(){
 echo "==> Removing older version of docker if already installed..."
 yum remove -y docker \
  docker-client \
  docker-client-latest \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-engine 2>/dev/null

  echo "==> Installing docker repository..."
  yum -y install yum-utils device-mapper-persistent-data lvm2 2>/dev/null
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 2>/dev/null

  echo "==> Installing docker community edition..."
  yum -y install docker-ce docker-ce-cli containerd.io
}

function startDocker(){
 if systemctl status docker.service &>/dev/null
 then
  echo "==> Docker service is already running..."
  exit 0
 else
  echo "Enabling & Starting docker service..."
  systemctl enable docker.service
  systemctl start docker.service
  exit 0
 fi
}

function runReport(){
cat <<EOF
Docker is installed on $(hostname -s)
Run docker info for more information
EOF
}

runReport
rootUser
osRelease
isDockerInstalled
installDocker
startDocker
runReport
