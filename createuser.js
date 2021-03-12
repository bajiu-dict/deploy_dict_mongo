// comment auth in /etc/mongodb.conf
use admin;
db.createUser(
  {
    user: "dict",
    pwd: "turingmachine", // or cleartext password
    roles: [ 
      {role: "dbOwner", db: "es2cn"},
      {role: "dbOwner", db: "en2cn"},
      {role: "dbOwner", db: "tbr_es2cn"},
      {role: "dbOwner", db: "tbr_en2cn"},
      {role: "dbOwner", db: "dict_user"} 
    ]
  }
)
