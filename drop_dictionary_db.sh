source "./env.sh"
mongo ${ES_DICT_DB} --eval="db.dropDatabase()" --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB}
mongo ${EN_DICT_DB} --eval="db.dropDatabase()" --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB}

