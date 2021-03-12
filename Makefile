include .env

# Create db user
# Set mongodb auth config as disable, then execute. After dbuser creation, enable auth
create_dbuser:
	mongo < createuser.js

# Set mongodb auth config as disabled, then execute. After dbuser creation, disable auth
delete_dbuser:
	mongo < deleteuser.js

PERMIT=--username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB}

# For the very first time, dump production data from db content, and generate to-be-reviewed data from production data 

prep_prod:
	mongodump ${PERMIT} --archive=${INIT_DIR}/prod-${ES_DICT_DB} --db=${ES_DICT_DB} 
	mongodump ${PERMIT} --archive=${INIT_DIR}/prod-${EN_DICT_DB} --db=${EN_DICT_DB} 

prep_tbr:
	mongorestore ${PERMIT} --drop --archive=${INIT_DIR}/prod-${ES_DICT_DB} --nsFrom=${ES_DICT_DB}.* --nsTo=tbr_${ES_DICT_DB}.*
	mongorestore ${PERMIT} --drop --archive=${INIT_DIR}/prod-${EN_DICT_DB} --nsFrom=${EN_DICT_DB}.* --nsTo=tbr_${EN_DICT_DB}.*
	mongo tbr_${ES_DICT_DB} ${PERMIT} < add_reviewed_field.js
	mongo tbr_${EN_DICT_DB} ${PERMIT} < add_reviewed_field.js
	mongodump ${PERMIT} --archive=${INIT_DIR}/tbr-${ES_DICT_DB} --db=tbr_${ES_DICT_DB} 
	mongodump ${PERMIT} --archive=${INIT_DIR}/tbr-${EN_DICT_DB} --db=tbr_${EN_DICT_DB} 

# Init db from data files

init_prod:
	mongorestore ${PERMIT} --drop --archive=${INIT_DIR}/prod-${ES_DICT_DB}
	mongorestore ${PERMIT} --drop --archive=${INIT_DIR}/prod-${EN_DICT_DB}

init_tbr:
	mongorestore ${PERMIT} --drop --archive=${INIT_DIR}/tbr-${ES_DICT_DB}
	mongorestore ${PERMIT} --drop --archive=${INIT_DIR}/tbr-${EN_DICT_DB}

# Hash code of production db and to_be_reviewed db

hash_prod:
	mongo ${ES_DICT_DB} ${PERMIT} --eval "db.runCommand({ dbHash:1 })" 
	mongo ${EN_DICT_DB} ${PERMIT} --eval "db.runCommand({ dbHash:1 })" 

hash_tbr:
	mongo tbr_${ES_DICT_DB} ${PERMIT} --eval "db.runCommand({ dbHash:1 })"
	mongo tbr_${EN_DICT_DB} ${PERMIT} --eval "db.runCommand({ dbHash:1 })"


# Version control of tbr db 

save_en_tbr: ${TBR_DIR}
	mongodump ${PERMIT} --archive=${TBR_DIR}/tbr-${EN_DICT_DB}-${VERSION} --db=tbr_${EN_DICT_DB} 
	ls ${TBR_DIR}/tbr-${EN_DICT_DB}-*

save_es_tbr: ${TBR_DIR}
	mongodump ${PERMIT} --archive=${TBR_DIR}/tbr-${ES_DICT_DB}-${VERSION} --db=tbr_${ES_DICT_DB} 
	ls ${TBR_DIR}/tbr-${ES_DICT_DB}-*

remove_en_tbr:
	rm -rf  ${TBR_DIR}/tbr-${EN_DICT_DB}-${VERSION}
	ls ${TBR_DIR}

remove_es_tbr:
	rm -rf  ${TBR_DIR}/tbr-${ES_DICT_DB}-${VERSION}
	ls ${TBR_DIR}

# Version control of production db

save_en_prod:
	mongorestore ${PERMIT} --drop --archive=${TBR_DIR}/tbr-${EN_DICT_DB}-${VERSION} --nsFrom=tbr_${EN_DICT_DB}.* --nsTo=${EN_DICT_DB}.*
	mongo ${EN_DICT_DB} ${PERMIT} < remove_reviewed_field.js
	mongodump ${PERMIT} --archive=${PROD_DIR}/prod-${EN_DICT_DB}-${VERSION} --db=${EN_DICT_DB} 

save_es_prod:
	mongorestore ${PERMIT} --drop --archive=${TBR_DIR}/tbr-${ES_DICT_DB}-${VERSION} --nsFrom=tbr_${ES_DICT_DB}.* --nsTo=${ES_DICT_DB}.*
	mongo ${ES_DICT_DB} ${PERMIT} < remove_reviewed_field.js
	mongodump ${PERMIT} --archive=${PROD_DIR}/prod-${ES_DICT_DB}-${VERSION} --db=${ES_DICT_DB} 

remove_en_prod:
	rm -rf  ${PROD_DIR}/prod-${EN_DICT_DB}-${VERSION}
	ls ${PROD_DIR}

remove_es_prod:
	rm -rf  ${PROD_DIR}/prod-${ES_DICT_DB}-${VERSION}
	ls ${PROD_DIR}

# Make latest version

make_es_prod_latest:
	cd ${PROD_DIR};rm prod-${ES_DICT_DB}-latest;ln -s prod-${ES_DICT_DB}-${VERSION} prod-${ES_DICT_DB}-latest

make_en_prod_latest:
	cd ${PROD_DIR};rm prod-${EN_DICT_DB}-latest;ln -s prod-${EN_DICT_DB}-${VERSION} prod-${EN_DICT_DB}-latest

make_es_tbr_latest:
	cd ${TBR_DIR};rm tbr-${ES_DICT_DB}-latest;ln -s tbr-${ES_DICT_DB}-${VERSION} tbr-${ES_DICT_DB}-latest

make_en_tbr_latest:
	cd ${TBR_DIR};rm tbr-${EN_DICT_DB}-latest;ln -s tbr-${EN_DICT_DB}-${VERSION} tbr-${EN_DICT_DB}-latest


# Deploy tbr or prod db

deploy_es_prod:
	ls -al ${PROD_DIR}/prod-${ES_DICT_DB}-${VERSION}
	mongorestore ${PERMIT} --drop --archive=${PROD_DIR}/prod-${ES_DICT_DB}-${VERSION}

deploy_en_prod:
	ls -al ${PROD_DIR}/prod-${EN_DICT_DB}-${VERSION}
	mongorestore ${PERMIT} --drop --archive=${PROD_DIR}/prod-${EN_DICT_DB}-${VERSION}

deploy_es_tbr:
	mongorestore ${PERMIT} --drop --archive=${TBR_DIR}/tbr-${ES_DICT_DB}-${VERSION}

deploy_en_tbr:
	mongorestore ${PERMIT} --drop --archive=${TBR_DIR}/tbr-${EN_DICT_DB}-${VERSION}

# Drop tbr or prod db

drop_es_prod:
	mongo ${ES_DICT_DB} ${PERMIT} --eval="db.dropDatabase()"	
drop_en_prod:
	mongo ${EN_DICT_DB} ${PERMIT} --eval="db.dropDatabase()"
drop_es_tbr:
	mongo tbr_${ES_DICT_DB} ${PERMIT} --eval="db.dropDatabase()"	
drop_en_tbr:
	mongo tbr_${EN_DICT_DB} ${PERMIT} --eval="db.dropDatabase()"

# Scenario 0: Init prod and tbr db
init: init_tbr hash_tbr init_prod hash_prod

# Scenario 1: When reviewed is finished, save tbr, prod, and make it as latest
create_en_version: save_en_tbr save_en_prod make_en_prod_latest make_en_tbr_latest
create_es_version: save_es_tbr save_es_prod make_es_prod_latest make_es_tbr_latest

# Scenario 2: Deploy production db with latest version
deploy_prod: deploy_es_prod deploy_en_prod

# Scenario 3: Deploy tbr db with latest version
deploy_tbr: deploy_es_tbr deploy_en_tbr
