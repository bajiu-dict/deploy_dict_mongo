// comment auth in /etc/mongodb.conf

db = db.getSiblingDB('es2cn');
db.createUser(
  {
    user: "phoenix",
    pwd: "turingmachine", // or cleartext password
    roles: [ 
      { 
        role: "dbOwner", 
        db: "es2cn" }
    ]
  }
);
db.createCollection('test');


db = db.getSiblingDB('dict_user');
db.createUser(
  {
    user: "phoenix",
    pwd: "turingmachine", // or cleartext password
    roles: [ 
      { 
        role: "dbOwner", 
        db: "dict_user" }
    ]
  }
);
db.createCollection('test');
