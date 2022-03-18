# Rocket Elevators: Commercial Controller with Rust <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [Project Description](#project-description)
- [Application Requirements](#application-requirements)
- [Using the Web App Features](#using-the-web-app-features)
- [Credits](#credits)

## Project Description

The project serves a three-fold purposes: (1) the conversion of static to dynamic website, and (2) the utilization of databases and data warehouse, and (3) creation of back office. The conversion to dynamic website was implemented using Ruby on Rails framework. With respect to front-end tasks, this included the use of Asset Pipeline, Rails Routing, Partials, and Controller. For back-end related tasks, the project utilized MySQL and PostgreSQL for database and data warehousing, respectively. All active records along with their associations were generated using Rails commands, and data entries stored in the seed file was generated using Faker gem. Lastly, the back office was generated using Rails_Admin gem along with Devise gem for user authentication and user session management. 

## Application Requirements

-   [Ruby](https://www.ruby-lang.org/en/downloads/) (v2.7.5)
-   [Rails](https://rubyonrails.org/) (v.5.2.6)

## Using the Web App Features

### 1. Quote Form & Contact Form Submission
All users and non-users can submit quote and contact form. Submitted data will then be stored in the database on the tables 'Quotes' and 'Leads', respectively.

### 2. Databases & Data Warehouse
MySQL database of the web app contains data associated with: users, employees, customers, buildings, batteries, columns, elevators, addresses (of buildings & customers), quote form submission, and contact form submission (lead). Data entries regarding to customers, quote form, contact form, and deployed elevators with a creation date timestamp within the last 3 years (2019 - 2022) were stored in a PostgreSQL data warehouse. Extraction and loading of data from MySQL to PostgreSQL were performed using the rake task commands outlined below. Note that the <database_name> is the name of database for the data warehouse in PostgreSQL.

- Pertaining to quote form submission:
  ```
  rake warehouse:create_quoteFact[<database_name>]
  rake warehouse:import_quoteFact[<database_name>]
  ```
- Pertaining to contact form submission:
  ```
  rake warehouse:create_quoteFact[<database_name>]
  rake warehouse:import_quoteFact[<database_name>]
  ```
- Pertaining to deployed elevators:
  ```
  rake warehouse:create_quoteFact[<database_name>]
  rake warehouse:import_quoteFact[<database_name>]
  ```
- Pertaining to customers:
  ```
  rake warehouse:create_dimCustomer[<database_name>]
  rake warehouse:import_dimCustomer[<database_name>]
  ```
The rake task is also equipped with 3 queries and can be executed using the following commands:
- Query 1: The number of unique requests grouped by Month (2019-2022)
  ```
  rake query:one[<database_name>]
  ```
- Query 2: Number of unique requests grouped by Month (2019-2022)
  ```
  rake query:two[<database_name>]
  ```
- Query 3: Total number of elevators contained belonging to each customer (2019-2022)
  ```
  rake query:three[<database_name>]
  ```
Upon successful execution, the following query results will be printed on the console.

### 3. Access to Back Office (Restricted)
Access to back-end office is restricted to users that were assigned as [employees](https://docs.google.com/spreadsheets/d/1-S0updscUGOpBpFE-2plFBJlVkCseOUuUpp7nu5e-fY/edit#gid=1786076246). Email and password are also required to access the back-end office. To login, simply use the employee's email and using the password that follows the logic of: first letter of first name + first letter of last names + 1234. For example:
  * User example: Francis Patry-Jessop
    * Email: francis.patry-jessop@codeboxx.biz
    * Password: fpj1234
  * User example: Patrick Thibault
    * Email: patrick.thibault@codeboxx.biz
    * Password: pt1234

## Credits

This project was made possible through the support of:

-   Emmanuela Derilus
-   Mathieu	Houde
-   Patrick Thibault
-   Francis Patry-Jessop
-   CodeBoxx School of Technology Community

