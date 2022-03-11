# README

This is the database system within the Genesis Project. We made the website dynamic instead of static, added a backdoor office, added a way to sign in as a User, created a table of Employees who have Admin permissions and added a way to collect data done from Quote forms and accessible from the back office. We also created some random users to test the admin permissions.

We used:

* Ruby version "2.7.5"

* Rails version "5.2.6"

* Database creation
  database.yml -> Make sure rocketelevatorsfoobar is seleceted as your database.
  mysql rocketelevatorsfoobar made on 3/11/2022
  includes Users, Employees, Quotes

* Database initialization
  $ rake db:create
  $ rake db:migrate

* Deployment instructions
