# Pairmiscuous

Promiscuous Pair Programming web app @ Makers Academy Makermix

https://github.com/makersacademy/course/blob/master/makermix/intro_to_makermix.md

Kanban board: https://waffle.io/rodcul/pairmiscuous

![Pairing is cairing](app/assets/images/pairmiscuous.jpg)

## Goals for app
- Reduce awkwardness around pairing
- Ensure everyone pairs with everyone (Promiscuo Pairing)

## Sprint 24-26 June 2015
- [ ] Sign up using github and select cohort
- [ ] Log pair session
- [ ] Allow users to select another pair partner and log reason for that
- [ ] Show pairing matrix by cohort

## Backlog

- [ ] What to do with odd number cohort?
- [ ] Responsive: mobile & tablet
- [ ] Email integration
- [ ] Delete previously logged pairing session
- [ ] Slack integration
- [ ] Allow for 3 way pairing
- [ ] Leaderboard of promiscuous pairer
- [ ] Allow pairing with users not in cohort (coaches/alumni helpers)
- [ ] Add a custom profile picture
- [ ] Sentiment monitoring
- [ ] Plan for bank holidays/known or planned absence

## User personas

- [ ] Students
- [ ] Alumni helpers
- [ ] Coaches

## What's going to give?

|   |  LIKELY |   | MAYBE  |   | DEFINITELY NOT  |
|---|:---:|:---:|:---:|:---:|:---:|
|SCOPE  |  X |   |   |   |   |
|HOURS   |   |   | X  |   |   |
|TESTING/QUALITY   |   |   |   | X  |   |
|TECH (MEAN.JS)   | X  |   |   |   |   |
|TEAMWORK/PAIRING/COMMUNICATION   |   |   |   |   | X  |
|UX/DESIGN   |   |   | X  |   |   |

## Tech stack
- MEAN.JS (hopefully MongoDB, Express, Angular/Ember, Node)
- Testing: Unit & Feature (Karma + ?)
- Bootstrap
- Travis CI
- Coveralls
- Gitflow using feature branches!!

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* Ruby on Rails
* PSQL

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
