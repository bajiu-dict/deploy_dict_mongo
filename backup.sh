source "./env.sh"

mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${DICT_DB} --out ${BACKUPDIR} 
mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${USER_DB} --out ${BACKUPDIR} 
