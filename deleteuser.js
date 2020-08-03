// comment auth in /etc/mongodb.conf
use admin;
db.dropUser("phoenix", {w: "majority", wtimeout: 4000})
