# README

This README describes steps needed to run this application



* Ruby version 
    * `ruby-2.6.1`

* System dependencies
    * *Mysql 5.7 should work in 5.6 as well*

* Database creation
    * `rails db:create`
    * `rails db:migrate`

* Database Reset
    * `rails db:drop db:create db:migrate`

* How to run the test suite
    * `rspec spec`
* Seed data is included and can be run by following command
    * `rails db:seed`

#### Note

The application is generated using rails 6, with new rails 6 changes the assets pipeline offers webpack as well. This application although relies on the traditional asset pipeline
