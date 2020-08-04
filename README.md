# Deploy Dictionary Mongodb

## Description

This repo is a quickstart project for mongodb deployment.

## Requirement

1. docker( See reference [here](https://docs.docker.com/engine/install/ubuntu/))

    ```bash
    # Remove old version
    sudo apt-get remove docker docker-engine docker.io containerd runc

    # Set up repository
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # Install docker engine
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    # Add permission to docker
    sudo usermod -aG docker USER
    ```

2. docker-compose

    ```bash
    # Download binary and add execuable permission
    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    ```

3. apt command

    ```bash
    sudo apt install -y make mongodb-clients git
    ```

## Quick Start

This project will use localhost port 27017 and 8081, make sure those ports are not in use before start.

1. Start mongodb

    ```bash
    make start
    ```

2. Restore db data

    ```bash
    make restore
    ```

3. Backup db data

    ```bash
    make backup
    ```

4. Stop mongodb

    ```bash
    make stop
    ```

## Maintenance

- Backup dictionary db

```bash
./backup_dictionary.sh
```

- Backup client db

```bash
./backup_client.sh
```

- Drop dictionary db

```bash
./drop_dictionary_db.sh
```

- Drop client db

```bash
./drop_client_db.sh
```

- Delete user

```bash
,/deleteuser.sh
```
