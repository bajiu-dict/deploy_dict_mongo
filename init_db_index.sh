mongo en2cn --eval 'db.vocabs.createIndex({ word: 1})' --username dict --password turingmachine --authenticationDatabase admin
mongo es2cn --eval 'db.vocabs.createIndex({ word: 1})' --username dict --password turingmachine --authenticationDatabase admin

mongo es2cn --eval 'db.verbs_extension.createIndex({ word: 1})' --username dict --password turingmachine --authenticationDatabase admin
mongo es2cn --eval 'db.verbs_inverse_variation.createIndex({ word: 1})' --username dict --password turingmachine --authenticationDatabase admin

mongo en2cn --eval 'db.sentences.createIndex({ original: "text"}, {default_language: "english"})' --username dict --password turingmachine --authenticationDatabase admin
mongo es2cn --eval 'db.sentences.createIndex({ original: "text"}, {default_language: "spanish"})' --username dict --password turingmachine --authenticationDatabase admin
