source "./env.sh"

mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --drop ${BACKUPDIR}

