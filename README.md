Data Engineering
=========

The skeleton for this application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).


Database
--------

This application uses SQLite with ActiveRecord


Development
-----------

 Webrick webserver, ERB engine, RSpec and Factory Girl, Bootstrap 3.0 (w/Sass), SimpleForm, Devise, CanCan


Getting Started
---------------

- Requires: Ruby 2.0, Rails 4.0
- Clone the git repository to a local directory
- cd to the project directory
- on the command line, run: bundle install
- on the command line, run: rake db:migrate
- from the command line, run: rails s

The 'rails s' command will start the server on localhost on port 3000

To Run Rspec:

- at a command prompt in the project root directory, run: rspec

Notes from the author
---------------------

- I would think if this were ever in production the processing of the CSV file
  should be done asynchronously out of process using some task framework, like sidekiq or resque to avoid DoS
- I do require you to login for the 'destructive' operations, such as uploading a
  data file, or editing any of the items in the database, however, I didn't have
  enough time to make roles work yet which would have limited access based on
  assignment.  

  For the sake of the demo:
  - logged in = admin
  - not logged in = guest

Contributing
------------

If you make improvements to this application, please share with others.

-   Fork the project on GitHub.
-   Make your feature addition or bug fix.
-   Commit with Git.
-   Send the author a pull request.


Credits
-------
Dave Dolan and the respective authors of the gems and scripts used in the app.
em: dave.dolan _at_ gmail

License
-------

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
