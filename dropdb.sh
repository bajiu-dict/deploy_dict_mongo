source "./env.sh"
mongo ${DB} --eval="db.dropDatabase()" --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB}
