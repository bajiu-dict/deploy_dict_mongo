include ${PWD}/env.sh

.PHONY: start stop clean
start:
	docker-compose up -d
stop:
	docker-compose down
clean:
	sudo rm -r mongo-data

.PHONY: restore restore_client restore_dict
restore: restore_client restore_dict
restore_dict:
	mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --drop --nsInclude=${DICT_DB}.* ${BACKUPDIR}
restore_client:
	mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --drop --nsInclude=${USER_DB}.* ${BACKUPDIR}

.PHONY: backup backup_client backup_dict
backup: backup_client backup_dict
backup_client:
	mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${USER_DB} --out ${BACKUPDIR} 
backup_dict:
	mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${DICT_DB} --out ${BACKUPDIR} 

