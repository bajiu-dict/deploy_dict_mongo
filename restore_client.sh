source "./env.sh"

mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --nsInclude=${USER_DB}.* ${BACKUPDIR}

