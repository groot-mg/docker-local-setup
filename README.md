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
git clone https://github.com/groot-mg/docker-local-setup.git
```

2.2 - Download submodules source-code:
```shell
git submodule update --init
```
2.3 - run the script
```shell
./docker-compose.sh
```

### Extra
Update submodules locally for already cloned repository:
```
git submodule update --remote
```

## 3. Health checks

Containers are started, how do you confirm if everything is working as expected?

### 3.1 Grafana dashboards

.. coming soon ..

### 3.2 Manual requests

As an alternative, instead accessing grafana dashboard to confirm the containers health, you can make the requests manually:

| Component         | Health check endpoint                |
|-------------------|--------------------------------------|
| Keycloak          | http://localhost:8180/health         |
| Prometheus        | http://localhost:9090/-/healthy      |
| Alert Manager     | http://localhost:9093/-/healthy      |
| Grafana           | http://localhost:3000/health         |
| Grafana Loki      | http://localhost:3100/ready          |
| Grafana Tempo     | http://localhost:3101/ready          |
| Api Gateway       | http://localhost:8080/private/health | 
| Service Discovery | http://localhost:8081/private/health |
| Sales Catalog     | http://localhost:8082/private/health |
