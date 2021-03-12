db.vocabs.find().forEach(function(e){
  var t=e.explanation;
  t.forEach(function(e){
    e.reviewed=0
  });
  db.vocabs.update({_id:e._id},{$set:{explanation:t}})
})
