source "./env.sh"

mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${DB} --out ${BACKUPDIR} 
