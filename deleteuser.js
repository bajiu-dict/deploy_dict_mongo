// comment auth in /etc/mongodb.conf
use admin;
db.dropUser("me", {w: "majority", wtimeout: 4000})
