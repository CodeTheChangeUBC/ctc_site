# Code the Change - UBC Chapter
*Club Website*

Hi and welcome to the UBC Chapter of Code the Change's website project page. It is written in ruby on rails with PostgreSQL database support. See the Gemfile for a complete listing of modules. The site can be found [here](http://codethechangeubc.org).

### Some notes: ###

* Ruby version: 2.0.0

* Rails version: >= 5.0.0

* Deployment instructions: 
	 - **Remotely** Heroku auto-deploys from production branch. Ensure this branch is always stable!
	 - **Locally** Run `rails server` or `rails s` for a localhost server at port 3000. To specify a different port include `-p`, e.g., `rails s -p 3001`. 
     - Be sure to get a copy of config/application.yml config/secrets.yml from one of the project maintainers on CtC Slack at #our-website
	 

* Database Manipulation:
	- To update database after update or adding a model run `rake db:migrate`. This migrates the current schema.
	- To seed the database run `rake db:seed`
	- To reset the database and reload the current database run `rake db:reset db:migrate`
	- To destroy the database, create and migrate it run `rake db:reset db:migrate`
	- After modifying the database, to run tests first run `rake db:test:prepare`


