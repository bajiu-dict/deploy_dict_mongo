// comment auth in /etc/mongodb.conf

admin_db = db.getSiblingDB('admin');
admin_db.createUser(
  {
    user: "phoenix",
    pwd: "turingmachine", // or cleartext password
    roles: [ 
      { 
        role: "dbOwner", 
        db: "es2cn" },
      {
        role: "dbOwner", 
        db: "dict_user"
      }
    ]
  }
);

dict_db = db.getSiblingDB('es2cn');
dict_db.createCollection('test');

user_db = db.getSiblingDB('dict_user');
user_db.createCollection('test');