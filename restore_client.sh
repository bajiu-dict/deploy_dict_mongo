source "./env.sh"

mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --drop --nsInclude=${USER_DB}.* ${BACKUPDIR}

