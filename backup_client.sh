source "./env.sh"

mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${USER_DB} --out ${BACKUPDIR} 
