#!/bin/bash

USERNAME=phoenix
PASSWORD=turingmachine
DICT_DB=es2cn
USER_DB=dict_user
AUTHDB=admin
BACKUPDIR=${PWD}/backup

# environment variables for mongodb docker
MONGO_INITDB_DATABASE=admin
MONGO_INITDB_ROOT_USERNAME=root
MONGO_INITDB_ROOT_PASSWORD=abc123_

# environment variables for mongo express
ME_CONFIG_MONGODB_SERVER=mongodb
ME_CONFIG_MONGODB_ADMINUSERNAME=root
ME_CONFIG_MONGODB_ADMINPASSWORD=abc123_
