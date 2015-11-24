# wp-stack
WordPress stack for standalone websites development.

## Components

It consists of the following components:

* WordPress 4.3.1
* [Roots Bedrock](https://github.com/roots/bedrock) 1.4.5
* [Roots Bedrock-Capistrano](https://github.com/roots/bedrock-capistrano) (commit 01a2657)

## Requirements

* PHP 5.5
* [Composer](http://getcomposer.org) - for PHP dependencies
* [Vagrant](http://www.vagrantup.com) - for a local environment
* (Optional) Ruby >= 1.9
* (Optional) capistrano (>3.1.0) and capistrano-composer Ruby gems (can be installed using Bundler)

## Features

* Composer as a dependency manager
* WordPress code in a separate directory (managed by Composer as a dependency)
* WordPress themes and plugins managed by Composer as a dependency
* Vagrant for complete local environment
* Capistrano as a deployer


## Installation

1. Clone this repo.
2. Run `build.sh` script to adjust an IP address and a domain for your local environment.
3. (Optional) Define your stage environments (eg. staging, production) in `config/deploy` and set correct repo URL and application name in `config/deploy.rb`
4. Go to the project folder, type `vagrant up` and wait for Vagrant to setup your local environment.
5. Type `vagrant ssh` and then download all the dependencies from Vagrant machine: `cd /vagrant && composer install`.
6. Now you can start developing your theme in `web/app/themes` :) If you want, you can install [Sage theme by Roots](https://github.com/roots/sage) using this script:
```
wget https://github.com/roots/sage/archive/master.zip && unzip master.zip -d web/app/themes && mv web/app/themes/sage-master web/app/themes/base-theme && rm master.zip
```
7. Update your `/etc/hosts` file with same IP address and domain which you set in the second step, or use the default: `192.168.30.11 wordpress.local`.
8. Access your WordPress installation using following URLs:
    * [http://wordpress.local](http://wordpress.local) - site
    * [http://wordpress.local/wp/wp-admin](http://wordpress.local/wp/wp-admin) - admin panel
