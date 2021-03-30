# Init Mongo

### Install mongo

* If your user is `root`, execute `./install_mongo.sh`
* If your user is `non-root`, you need `sudo` right to install `mongo`, by `sudo ./install_mongo.sh`

### Connect with mongo
```
mongo
```

### Play with mongo
Refer to [mongo shell](https://docs.mongodb.com/manual/mongo/)

### Create db owner 
```
make create_dbuser
```

### Reconfig mongo server

Since we create an owner of db `es2cn`, we would like to access to db through auth, we have to reconfig mongo db server.

* Edit `/etc/mongodb.conf`, enable auth
* Restart mongodb by `systemctl restart mongodb`


### Deploy pre production db for application
```
make deploy_for_app
```
which deploys `en2cn`, `es2cn` with collections related with application usage respectively.


# Other scenarios

### Scenario 1: Restore pre production db for application and reviewing 
```
make prep_preprod
```

### Scenario 2: Deploy pre production db for reviewing
```
make deploy_for_tbr
```

### Scenario 3: Delete db user
```
make delete_dbuser
```

### Scenario 4: Backup data for initialization, only used for the first time
```
make init_preprod
```
which creates production db and tbr db from folder `initdata`


