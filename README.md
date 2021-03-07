# Use for the first time

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
./create_user.sh
```

### Reconfig mongo server

Since we create an owner of db `es2cn`, we would like to access to db through auth, we have to reconfig mongo db server.

* Edit `/etc/mongodb.conf`, enable auth
* Restart mongodb by `systemctl restart mongodb`


### Init dictionary db
```
./restore_dictionary.sh
```

### Init client db
```
./restore_client.sh
```

# Maintenance

### Backup dictionary db
```
./backup_dictionary.sh
```

### Backup client db
```
./backup_client.sh
```

### Drop dictionary db
```
./drop_dictionary_db.sh
```

### Drop client db
```
./drop_client_db.sh
```

### Delete user
```
./deleteuser.sh
```
