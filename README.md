== README

This README would normally document whatever steps are necessary to get the
application up and running.

### Project setup on local environment

```
git clone https://github.com/rodcul/pairmiscuous.git
cd pairmiscuous
bundle
bin/rake db:create
rails s
```
Now visit http://localhost:3000/ in your browser!

#### Tests

```
bin/rake db:create RAILS_ENV=test
rspec
```

### Seed database with 50 users
(an error will be thrown if the rails server is running)

```bin/rake db:seed```

Reset database:

```bin/rake db:reset```


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
