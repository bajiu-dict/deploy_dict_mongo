source "./env.sh"

mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --drop --nsInclude=${ES_DICT_DB}.* ${BACKUPDIR}
mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --drop --nsInclude=${EN_DICT_DB}.* ${BACKUPDIR}


