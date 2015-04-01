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
>Using ComfortableMexicanSofa

Initial Setup
-------------

* Clone the repo: `git clone https://github.com/liamdarmody/growthpal.git`

* Update config files:

  * config/application.yml

  * config/database.yml

* Temporarily set your PG Path: `export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin`

* Run `bundle`

* Drop, Migrate and Seed the Database: `rbricks -r`

Add CMS Fixtures to CMS
-------------

* Create Site in Database:

  * Local:

    * Run `rake Comfy::Cms::Site.create!(label: 'Main Site', identifier: 'main-site', hostname: 'localhost:3000')`

    OR

    * Start the server locally and visit "localhost:3000/admin/sites". When the page loads, add a site with the following details: `Main Site, main-site, localhost:3000`

  * Heroku:

    * Run `heroku run rake Comfy::Cms::Site.create!(label: 'Main Site', identifier: 'main-site', hostname: 'growthpal.herokuapp.com')`

    OR

    * Visit "yourappname.herokuapp.com/admin/sites". When the page loads, add a site with the following details: `Main Site, main-site, localhost:3000`

> If that doesn't work, start the server locally and visit localhost:3000/admin/sites. When the page loads, add a site with the following details: `Main Site, main-site, localhost:3000`

* Create Blog in Database:

  * Local:

    * Start the server locally and visit "/admin/sites/1/blogs" & add a blog with the following details: `Main Blog, main-blog, application`

  * Heroku:

    * Visit "yourappname.herokuapp.com/admin/sites/1/blogs" & add a blog with the following details: `Main Blog, main-blog, application`

* Load CMS Fixtures into Database:

  * Local:

    * Run `rake comfortable_mexican_sofa:fixtures:import FROM=main-site-seed TO=main-site`

  * Heroku:

    * Run `heroku run rake comfortable_mexican_sofa:fixtures:import FROM=main-site-seed TO=main-site`

* Export Pages from Database into Files (optional):

  * Local:

    * Run `rake comfortable_mexican_sofa:fixtures:export FROM=main-site TO=main-site-seed`

  * Heroku:

    * Run `heroku run rake comfortable_mexican_sofa:fixtures:export FROM=main-site TO=main-site-seed`

> **Tip:** Check out the [Working with CMS fixtures](https://github.com/comfy/comfortable-mexican-sofa/wiki/Working-with-CMS-fixtures) to learn about other ways to speed up initial content population.

Update Page Content
-------------

* Login as Admin: 

  * Local: `localhost:3000/users/sign_in`

  * Heroku: `yourappname.herokuapp.com/users/sign_in`

* Visit the Admin Panel:

  * Local: `localhost:3000/admin`

  * Heroku: `yourappname.herokuapp.com/admin`

* Copy can be updated within "Snippets", "Pages" & "Blog"

Configuration
-------------

* The following files will need to be comfigured with your own variables:

  * config/application.yml

    * Sign up and login to [Mandrill](https://mandrill.com/signup/)

      * Get an API Key

    * Sign up and login to [Intercom](https://www.intercom.io/)

      * Get an App ID & API Secret

    * Sign up and login to [Stripe](https://stripe.com/au)

      * Get a Publishable Key & Secret Key

      * Integrate your Stripe account with Intercom

    * Create file with the following variables:

    ```
    # ENVIRONMENT VARIABLES
    
    # For Mandrill Mailer
    DOMAIN: "appname.herokuapp.com"
    SENDER_EMAIL: "hello@appname.com.au"
    MAILER_DOMAIN: "appname.herokuapp.com"
    SMTP_SERVER: "smtp.mandrillapp.com"
    SMTP_PORT: "25"
    SMTP_USER: "mandrill-login-email@example.com"
    SMTP_PWD: "mandrill-api-key"

    # For Intercom
    INTERCOM_APP_ID: "intercom-app-id"
    INTERCOM_API_SECRET: "intercom-api-secret"

    # For Stripe [Test]
    PUBLISHABLE_KEY: "stripe-publishable-key"
    SECRET_KEY: "stripe-secret-key"
    ```

  * app/views/layouts/_vwo_code.html.erb

    * Sign up and login to [Visual Website Optimiser](https://vwo.com)

    * Setup a campaign

    * Update the file with your own VWO smart code

  * app/views/layouts/google_analytics_script.html.erb

    * Sign up and login to [Google Analytics](http://www.google.com.au/analytics/)

    * Add your new site

    * Update the file with your own Google Analytics Script

  * app/views/layouts/disqus_script.html.erb

    * Sign up and login to [Disqus](https://disqus.com/)

    * Add your new site and choose "Universal Code"

    * Update the file with your own Disqus code

Push to Github
-------------

* Create new Github repository

* Remove origin remote: 'git remote rm origin'

* Add your new origin remote: `git remote add origin https://github.com/username/repository-name.git`

* Push to origin master: `git push -u origin master`

Deployment
-------------

* Setup Heroku Repo: `heroku create appname`

* Push to Heroku Repo: `git push heroku master`

* Migrate Database: `heroku run rake db:migrate`

* Seed Database: `heroku run rake db:seed`

* Install Figaro: `gem install "figaro"`

* Setup Env on Heroku: `figaro heroku:set -e production`

Point Heroku App to Domain
-------------

* Login to your domain registrar

* Within the domain management for your chosen domain, add a CNAME Record with an Alias for `appname.herokuapp.com`

* You may also need to remove default Name Servers
