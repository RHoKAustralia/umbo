# Umbo

[![Build Status](https://travis-ci.org/RHoKAustralia/umbo.svg?branch=master)](https://travis-ci.org/RHoKAustralia/umbo)

Heroku: https://umbo.herokuapp.com/
AWS: http://umbo-env.ar7w6bz2vy.ap-southeast-2.elasticbeanstalk.com/

### Random Hacks of Kindness

## Requirements:
Ruby 2.5.1 [how to install](https://www.ruby-lang.org/en/documentation/installation/)

Rails 5.2.1 [how to install](http://railsinstallfest.org/guides/installation/)

Postgresql [how to install](https://www.postgresql.org/download/)

## Instructions on how to setup, configure and use your App.
1. Clone this git repository

```
git clone https://github.com/RHoKAustralia/umbo.git
```
2. Navigate into directory
```
cd umbo
```
3. Install required gems
```
bundle install
```
4. Create database, run migrations.
```
rails db:create
rails db:migrate
```
5. Start the rails server
```
rails s
```
6. Open web browser and goto http://localhost:3000
