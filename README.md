# README

This is the database system within the Genesis Project. We made the website dynamic instead of static, added a backdoor office, added a way to sign in as a User, created a table of Employees who have Admin permissions and added a way to collect data done from Quote forms and accessible from the back office. We also created some random users to test the admin permissions.

We used:

* Ruby version "2.7.5"

* Rails version "5.2.6"

* Database creation
  database.yml (ubuntu) -> Make sure FeliciaHartono is seleceted as your database.
  includes Users, Employees, Quotes

* Database initialization
  $ bundle exec rake db:seed

* Deployment instructions
  User login:
  * email address of chosen user from employee list (https://docs.google.com/spreadsheets/d/1-S0updscUGOpBpFE-2plFBJlVkCseOUuUpp7nu5e-fY/edit#gid=1786076246)
  * password logic -> first letter of first and last names + 1234
              
  
  User example:
  * Email: francis.patry-jessop@codeboxx.biz
  * Password: fpj1234

  User example:
  * Email: patrick.thibault@codeboxx.biz
  * Password: pt1234
