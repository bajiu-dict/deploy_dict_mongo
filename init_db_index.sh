mongo en2cn --eval 'db.vocabs.createIndex({ word: 1})' --username dict --password turingmachine --authenticationDatabase admin
mongo es2cn --eval 'db.vocabs.createIndex({ word: 1})' --username dict --password turingmachine --authenticationDatabase admin
mongo es2cn --eval 'db.verbs_variation.createIndex({ word: 1})' --username dict --password turingmachine --authenticationDatabase admin
mongo es2cn --eval 'db.verbs_inverse_variation.createIndex({ word: 1})' --username dict --password turingmachine --authenticationDatabase admin

