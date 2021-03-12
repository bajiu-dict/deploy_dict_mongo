// comment auth in /etc/mongodb.conf
use admin;
db.dropUser("dict", {w: "majority", wtimeout: 4000})
