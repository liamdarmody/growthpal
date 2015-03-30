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

* Clone the repo: `git clone https://github.com/liamdarmody/growthpal.git`

* Update config files:

  * config/application.yml

  * config/database.yml

* Run `bundle`

* Drop, Migrate and Seed the Database: `rbricks -r`

Configuration
-------------

* The following files will need to be comfigured with your own variables:

  * config/application.yml

    * Sign up and login to [Mandrill](https://mandrill.com/signup/)

    * Get an API Key

    * Update the file with the following:

    ```
    # ENVIRONMENT VARIABLES
    DOMAIN: "appname.herokuapp.com"
    SENDER_EMAIL: "hello@appname.com.au"
    MAILER_DOMAIN: "appname.herokuapp.com"
    SMTP_SERVER: "smtp.mandrillapp.com"
    SMTP_PORT: "25"
    SMTP_USER: "mandrill-login-email@example.com"
    SMTP_PWD: "mandrill-api-key"
    ```

  * app/views/layouts/_vwo_code.html.erb

    * Sign up and login to [Visual Website Optimiser](https://vwo.com)

    * Setup a campaign

    * Update the file with your own VWO smart code

Deployment
-------------

* Setup Heroku Repo: `heroku create appname`

* Push to Heroku Repo: `git push heroku master`

* Migrate Database: `heroku run rake db:migrate`

* Seed Database: `heroku run rake db:seed`

* Install Figaro: `gem install "figaro"`

* Setup Env on Heroku: `figaro heroku:set -e production`

Add Seed Pages to CMS
-------------

* Create Site in Database:

  * Local: `rake Comfy::Cms::Site.create!(label: 'Main Site', identifier: 'main-site', hostname: 'localhost:3000')`

  * Heroku: `heroku run rake Comfy::Cms::Site.create!(label: 'Main Site', identifier: 'main-site', hostname: 'growthpal.herokuapp.com')`

* Load CMS Fixtures into Database:

  * Local: `rake comfortable_mexican_sofa:fixtures:import FROM=main-site-seed TO=main-site`

  * Heroku: `heroku run rake comfortable_mexican_sofa:fixtures:import FROM=main-site-seed TO=main-site`

* Export Pages from Database into Files (optional):

  * Local: `rake comfortable_mexican_sofa:fixtures:export FROM=main-site TO=main-site-seed`

  * Heroku: `heroku run rake comfortable_mexican_sofa:fixtures:export FROM=main-site TO=main-site-seed`

> **Tip:** Check out the [Working with CMS fixtures](https://github.com/comfy/comfortable-mexican-sofa/wiki/Working-with-CMS-fixtures) to learn about other ways to speed up initial content population. 

Update Page Content
-------------

* Login as Admin: 

  * Local: `localhost:3000/users/sign_in`

  * Heroku: `yourappname.herokuapp.com/users/sign_in`

* Visit the CMS:

  * Local: `localhost:3000/cms`

  * Heroku: `yourappname.herokuapp.com/cms`

* Go to "Pages" tab and update copy in the editor
