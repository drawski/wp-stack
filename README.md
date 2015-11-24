# wp-stack
WordPress stack for standalone websites development.

## Components

It consists of the following components:

* WordPress 4.3.1
* [Roots Bedrock](https://github.com/roots/bedrock) 1.4.5

## Requirements

* PHP 5.5
* [Composer](http://getcomposer.org) - for PHP dependencies
* [Vagrant](http://www.vagrantup.com) - for a local environment

## Installation

* Clone this repo.
* (Optional) Adjust IP address and domain in the following files: `Vagrantfile`, `provision/wordpress`.
* Go to the project folder, type `vagrant up` and wait for Vagrant to setup your local environment.
* Type `vagrant ssh` and then download all the dependencies from Vagrant machine: `cd /vagrant && composer install`.
* Now you can start developing your theme in `web/app/themes` :)
