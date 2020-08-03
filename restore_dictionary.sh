source "./env.sh"

mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --nsInclude=${DICT_DB}.* ${BACKUPDIR}

