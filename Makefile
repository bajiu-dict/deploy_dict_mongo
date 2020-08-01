.PHONY: start stop restore backup

start:
	docker-compose up -d

restore:
	source "${PWD}/env.sh"
	mongorestore --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --drop ${BACKUPDIR}

backup:
	source "${PWD}/env.sh"
	mongodump --username=${USERNAME} --password=${PASSWORD} --authenticationDatabase=${AUTHDB} --db=${DB} --out ${BACKUPDIR} 

stop:
	docker-compose down

clean:
	rm -r mongo-data

