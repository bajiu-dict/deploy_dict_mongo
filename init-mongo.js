// comment auth in /etc/mongodb.conf
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
)