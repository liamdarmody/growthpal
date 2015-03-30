# GrowthPal README

Welcome to GrowthPal. This package will help you validate your idea faster than ever before.

> "Fail fast, fail often."

*Inspired by The Lean Startup, Eric Ries.*

Features
-------------

* Fully Fledged RoR application packaged with useful gems

* Configured with a Devise authentication scheme

* Static Pages: Home, About, Contact Us

* Mailers Integrated with Mandrill

* Admin Dashboard

* Blog

System Requirements
-------------

* Ruby 2.1.2

* Rails 4.2.0

>Using RailsBricks (Version: 3.1.6)

Initial Setup
-------------

* Clone the repo: <kbd>git clone https://github.com/liamdarmody/growthpal.git</kbd>

* Update config files:

  * config/application.yml

  * config/database.yml

* Run <kbd>bundle</kbd>

* Drop, Migrate and Seed the Database: <kbd>rbricks -r</kbd>

Deployment
-------------

* Setup Heroku Repo: <kbd>heroku create appname</kbd>

* Push to Heroku Repo: <kbd>git push heroku master</kbd>

* Migrate Database: <kbd>heroku run rake db:migrate</kbd>

* Seed Database: <kbd>heroku run rake db:seed</kbd>

* Install Figaro: <kbd>gem install "figaro"</kbd>

* Setup Env on Heroku: <kbd>figaro heroku:set -e production</kbd>

Add Seed Pages to CMS
-------------

* Create Site in Database:

  * Local: <kbd>rake Comfy::Cms::Site.create!(label: 'Main Site', identifier: 'main-site', hostname: 'localhost:3000')</kbd>

  * Heroku: <kbd>heroku run rake Comfy::Cms::Site.create!(label: 'Main Site', identifier: 'main-site', hostname: 'growthpal.herokuapp.com')</kbd>

* Load CMS Fixtures into Database:

  * Local: <kbd>rake comfortable_mexican_sofa:fixtures:import FROM=main-site-seed TO=main-site</kbd>

  * Heroku: <kbd>heroku run rake comfortable_mexican_sofa:fixtures:import FROM=main-site-seed TO=main-site</kbd>

* Export Pages from Database into Files (optional):

  * Local: <kbd>rake comfortable_mexican_sofa:fixtures:export FROM=main-site TO=main-site-seed</kbd>

  * Heroku: <kbd>heroku run rake comfortable_mexican_sofa:fixtures:export FROM=main-site TO=main-site-seed</kbd>

> **Tip:** Check out the [Working with CMS fixtures](https://github.com/comfy/comfortable-mexican-sofa/wiki/Working-with-CMS-fixtures) to learn about other ways to speed up initial content population. 

Update Page Content
-------------

* Login as Admin: 

  * Local: <kbd>localhost:3000/users/sign_in</kbd>

  * Heroku: <kbd>yourappname.herokuapp.com/users/sign_in</kbd>

* Visit the CMS:

  * Local: <kbd>localhost:3000/cms</kbd>

  * Heroku: <kbd>yourappname.herokuapp.com/cms</kbd>

* Go to "Pages" tab and update copy in the editor
