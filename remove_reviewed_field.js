db.vocabs.find().forEach(function(e){
  var t=e.explanation;
  t.forEach(function(e){
		delete e.reviewed
  });
  db.vocabs.update({_id:e._id},{$set:{explanation:t}})
})
