# Pairmiscuous

Promiscuous Pair Programming web app @ Makers Academy Makermix

https://github.com/makersacademy/course/blob/master/makermix/intro_to_makermix.md

Kanban board: https://waffle.io/rodcul/pairmiscuous
Heroku: https://pairmiscuous.herokuapp.com/

![Pairing is cairing](https://pbs.twimg.com/media/CHh9GAyUwAIlInZ.png)

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
* [Node.js](http://nodejs.org/) (with NPM)
* [Bower](http://bower.io/)
* [Ember CLI](http://www.ember-cli.com/)
* [PhantomJS](http://phantomjs.org/)
* MongoDB

## Installation

* `git clone https://github.com/rodcul/pairmiscuous.git` this repository
* change into the new directory
* `npm install`

## Faker Test Data

  Make sure you have mongo installed and running
  * `brew install mongodb`
  * `mongod` starts mongodb

  To add in fake test data (into database 'promiscuousTest'), run

* `node app/fakerUserData.js` (To create a cohort of 30 in the users table)
* `node app/fakerPairData.js` (To create 15 pairs in the pairs table)

## Running / Development

* `brew install mongodb` starts mongo db
* `npm start` starts node server
* Visit your app at [http://localhost:4200](http://localhost:4200).

### Code Generators

Make use of the many generators for code, try `ember help generate` for more details

### Running Tests

* `npm test`

### Building

* `ember build` (development)
* `ember build --environment production` (production)

### Deploying

Specify what it takes to deploy your app.

## Further Reading / Useful Links

* [ember.js](http://emberjs.com/)
* [ember-cli](http://www.ember-cli.com/)
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  * [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)
