source "./env.sh"

mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${ES_DICT_DB} --out ${BACKUPDIR} 
mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${EN_DICT_DB} --out ${BACKUPDIR} 
