# Init Mongo

### Install mongo
```
./install_mongo.sh
```

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


### Deploy production db
```
make deploy_prod VERSION=latest
```
which deploys `en2cn`, `es2cn` with their latest version respectively.


# Common scenarios

### Scenario 1: Init production db and tbr db
```
make init
```
which creates production db and tbr db from folder `initdata`

### Scenario 2: When an iteration of review is done, create tbr db and production db with version, and it is the latest.
```
make create_en_version VERSION=1.2.0
make create_es_version VERSION=1.3.0
```
which creates `en2cn` and `tbr_en2cn` with version `1.2.0`, and creates `es2cn` and `tbr_es2cn` with version `1.3.0`.

### Scenario 3: Deploy tbr with latest version
```
make deploy_tbr VERSION=latest
```

# Other scenarios

### Scenario 1: Deploy production db `es2cn` or `en2cn` with arbitary version `x.x.x` 
```
make deploy_es_prod VERSION=x.x.x
make deploy_en_prod VERSION=x.x.x
```

### Scenario 2: Deploy tbr db `tbr_es2cn` or `tbr_en2cn` with arbitary version `x.x.x`
```
make deploy_es_tbr VERSION=x.x.x
make deploy_en_tbr VERSION=x.x.x
```

### Scenario 3: Archive `tbr_es2cn` or `tbr_en2cn` as arbitary version `x.x.x` 
```
make save_es_tbr VERSION=x.x.x
make save_en_tbr VERSION=x.x.x
```

### Scenario 4: Archive `es2cn` or `en2cn` as arbitary version `x.x.x`
```
make save_es_prod VERSION=x.x.x
make save_en_prod VERSION=x.x.x
```

### Scenario 5: Check the hash info of production db and tbr db
```
make hash_prod
make hash_tbr
```

### Scenario 6: Delete db user
```
make delete_dbuser
```
