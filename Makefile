include .env

# Create db user
# Set mongodb auth config as disable, then execute. After dbuser creation, enable auth
create_dbuser:
	mongo < createuser.js

# Set mongodb auth config as disabled, then execute. After dbuser creation, disable auth
delete_dbuser:
	mongo < deleteuser.js

PERMIT=--username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --host=${HOST}

# For the very first time, dump production data from db content, and generate to-be-reviewed data from production data 

prep_preprod:
	mongodump ${PERMIT} --archive=${INIT_DIR}/${ES_DICT_DB} --db=${ES_DICT_DB} 
	mongodump ${PERMIT} --archive=${INIT_DIR}/${EN_DICT_DB} --db=${EN_DICT_DB} 

# Init db from data files

init_preprod:
	mongorestore ${PERMIT} --drop --archive=${INIT_DIR}/${ES_DICT_DB}
	mongorestore ${PERMIT} --drop --archive=${INIT_DIR}/${EN_DICT_DB}

# Hash code of production db and to_be_reviewed db

hash_preprod:
	mongo ${ES_DICT_DB} ${PERMIT} --eval "db.runCommand({ dbHash:1 })" 
	mongo ${EN_DICT_DB} ${PERMIT} --eval "db.runCommand({ dbHash:1 })" 

# Deploy preprod db for application
deploy_es_preprod_for_app:
	mongorestore ${PERMIT} --drop --nsExclude=${ES_DICT_DB}.base --archive=${INIT_DIR}/${ES_DICT_DB}

deploy_en_preprod_for_app:
	mongorestore ${PERMIT} --drop --nsInclude=${EN_DICT_DB}.sentences --nsInclude=${EN_DICT_DB}.vocabs --archive=${INIT_DIR}/${EN_DICT_DB}

# Deploy preprod db for tbr
deploy_es_preprod_for_tbr:
	mongorestore ${PERMIT} --drop --nsInclude=${ES_DICT_DB}.verbs_variation --nsInclude=${ES_DICT_DB}.base --archive=${INIT_DIR}/${ES_DICT_DB}

deploy_en_preprod_for_tbr:
	mongorestore ${PERMIT} --drop --nsExclude=${EN_DICT_DB}.sentences --nsExclude=${EN_DICT_DB}.vocabs --archive=${INIT_DIR}/${EN_DICT_DB}

# Drop preprod db

drop_es_preprod:
	mongo ${ES_DICT_DB} ${PERMIT} --eval="db.dropDatabase()"	
drop_en_preprod:
	mongo ${EN_DICT_DB} ${PERMIT} --eval="db.dropDatabase()"

deploy_sentences:
	mongorestore ${PERMIT} --drop  backup_sen

# Scenario 0: Init preprod db
init: init_preprod hash_preprod

# Scenario 1: Deploy pre production db for application 
deploy_for_app: deploy_es_preprod_for_app deploy_en_preprod_for_app

# Scenario 2: Deploy pre production db for reviewing 
deploy_for_tbr: deploy_es_preprod_for_tbr deploy_en_preprod_for_tbr

