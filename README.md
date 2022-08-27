# Running in local environment

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/groot-mg/docker-local-setup/blob/main/LICENSE)


This repo synchronizes with other repositories in the project and runs everything together on docker containers.

## 1. Requirements

It is required:
* Java 17
* Docker and docker-compose

## 2. Running steps
2.1 - First clone the repository:
```shell
git clone ....
```

2.2 - Download submodules source-code:
```shell
git submodule update --init
```
3.3 - run the script
```shell
./docker-compose.sh
```

## 3. Health checks

Containers are started, how do you confirm if everything is working as expected?

### 3.1 Grafana dashboards

.. coming soon ..

### 3.2 Manual requests

As an alternative, instead accessing grafana dashboard to confirm the containers health, you can make the requests manually:

| Component         | Health check endpoint                |
|-------------------|--------------------------------------|
| Api Gateway       | http://localhost:8080/private/health | 
| Service Discovery | http://localhost:8081/private/health |
| Keycloak          | http://localhost:8180/health         |
| Prometheus        | Doesn't have it                      |
| Grafana           | Doesn't have it                      |
| Alert Manager     | Doesn't have it                      |