OAuth.initialize('9115fa97771a457ceb3b01806d75fda8ff4783f0');

OAuth.popup('facebook')
.done(function(result) {
  //use result.access_token in your API request 
  //or use result.get|post|put|del|patch|me methods (see below)
})
.fail(function (err) {
  //handle error with err
});