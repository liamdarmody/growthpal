# GrowthPal README

Welcome to GrowthPal. This package will help you validate your idea faster than ever before.

>"Fail fast, fail often."

*Inspired by The Lean Startup, Eric Ries.*

Features
-------------

* Fully Fledged RoR application packaged with useful gems

* Configured with a Devise authentication scheme

* Static Pages: Home, About, Contact Us

* Mailers Integrated with Mandrill

* Admin Dashboard

* Blog

Stack
-------------

* Ruby 2.1.2

* Rails 4.2.0

>Using RailsBricks (Version: 3.1.6)

Initial Setup
-------------

* Clone the repo

* Update config files:

  * config/application.yml

  * config/database.yml

* Run <kbd>bundle</kbd>

* Drop, Migrate and Seed the database: <kbd>rbricks -r</kbd>

Copy Tweaks
-------------

* Login as admin

* Update copy on pages using the Inline Editor

Deployment
-------------

* Setup Heroku Repo: <kbd>heroku create appname</kbd>

* Push to Heroku Repo: <kbd>git push heroku master</kbd>

* Migrate Database: <kbd>heroku run rake db:migrate</kbd>

* Seed Database: <kbd>heroku run rake db:seed</kbd>

* Install Figaro: <kbd>gem install "figaro"</kbd>

* Setup Env on Heroku: <kbd>figaro heroku:set -e production</kbd>
