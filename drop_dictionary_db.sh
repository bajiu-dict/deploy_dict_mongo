source "./env.sh"
mongo ${DICT_DB} --eval="db.dropDatabase()" --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB}
