source "./env.sh"

mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --drop --nsInclude=${DICT_DB}.* ${BACKUPDIR}

