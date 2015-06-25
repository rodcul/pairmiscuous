var mongoose = require('mongoose')

var faker = require('faker');

var User = mongoose.model('User', {name: String, email: String, username: String, image: String});

mongoose.connect('mongodb://localhost/promiscuousTest', function(err, db) {
  if (err) {
    console.log('Unable to connect to the mongoDB server. Error:', err);
  } else {
    console.log('Connection established');

    for (i = 0; i < 30; i ++) {

      var user1 = new User({
        name: faker.name.findName(),
        email: faker.internet.email(),
        username: faker.internet.userName(),
        image: faker.image.image()

      });

      user1.save(function (err, user) {
        if (err) {
          console.log(err)
        } else {
          console.log(user, ' was saved');
        }
      });
    }

  }

});