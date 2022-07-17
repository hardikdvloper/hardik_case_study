# Laravel Example App
> ### Practical for laravel job and practical provided by "Ali AlHabsi" on linkedin and provided google doc link of complete explanation. [Practical Link](https://docs.google.com/document/d/1j7slVasoNctjnKfcegLqo6isX-tk8Zed/edit).

Practical has been completed.

----------

# Getting started

## Installation

Please check the official laravel installation guide for server requirements before you start. [Official Documentation](https://laravel.com/docs/9.x/installation)


Clone the repository

    git clone https://github.com/hardikdvloper/hardik_case_study.git

Switch to the repo folder

    cd hardik_case_study

Install all the dependencies using composer

    composer install

Copy the example env file and make the required configuration changes in the .env file

    cp .env.example .env

Generate a new application key

    php artisan key:generate

Run the database migrations (Set the database connection in .env before migrating)

    php artisan migrate

Link public folder with storage path

    php artisan storage:link

Start the local development server

    php artisan serve

You can now access the server at http://localhost:8000
    
**Make sure you set the correct database connection information before running the migrations** [Environment variables](#environment-variables)

    php artisan migrate
    php artisan serve

***Note*** : It's recommended to have a clean database before seeding. You can refresh your migrations at any point to clean the database by running the following command

    php artisan migrate:refresh

## API Documentation

I have created Postman collection and list all the APIs on postman and links are as below.

> [Postman Public Json](https://www.getpostman.com/collections/9c70c432816f8c2b9b22)

> [Postman Documentation](https://documenter.getpostman.com/view/2746525/UzQvskDo)

----------

# Testing API

Run the laravel development server

    php artisan serve

The api can now be accessed at

    http://localhost:8000/api

Request headers

| **Required** 	| **Key**              	| **Value**            	|
|----------	|------------------	|------------------	|
| Yes      	| Content-Type     	| application/json 	|
| Optional 	| Authorization    	| Token {AccessToken}      	|

Refer the [api specification](#api-specification) for more info.

----------
# Database File

I have uploaded SQL file on this git repo. [SQL File Link](databasebackup/upayment_practical.sql).

***Note*** : I have created migration so you can check with it too.
