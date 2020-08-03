source "./env.sh"

mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${DICT_DB} --out ${BACKUPDIR} 
