var mongoose = require('mongoose')

var faker = require('faker');

var User = mongoose.model('User', {name: String, email: String, username: String, image: String});

var Pair = mongoose.model('Pair', {userID: Array})

var testPair = new Array();
var pair;

mongoose.connect('mongodb://localhost/promiscuousTest', function(err, db) {

  if (err) {
    console.log('Unable to connect to the mongoDB server. Error:', err);
  } else {
    console.log('Connection established');

    User.find({}, function(err, user) {
      if (err) {
        console.log(err)

      } else if (user) {

        for (i = 0; i < user.length; i ++ ) {

          testPair.push(user[i]);

          if (testPair.length == 2) {
            pair = new Pair({userID: testPair})
            pair.save(function (err) {
              if (err) {
                console.log(err)
              } else {
                console.log(pair, ' was updated');
              }
            });
            testPair.length = 0;
          }
        }
      }
    });


  }

setTimeout( function () {
  mongoose.disconnect();
}, 2000);

});