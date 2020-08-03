source "./env.sh"
mongo ${USER_DB} --eval="db.dropDatabase()" --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB}
