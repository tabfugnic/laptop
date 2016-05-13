#!/bin/bash

source lib/utils.sh

build_rails_app_test() {
    # Use some ruby
    chruby ruby

    # Move to development directory
    cd ~/dev

    # Install suspenders
    gem install suspenders

    # Create test app
    suspenders test_app
    cd test_app

    # Run setup
    ./bin/setup

    # Create an article
    rails generate model Article content title

    # run migration
    rake db:migrate

    # run tests
    rspec
}

fancy_echo "Build Rails App Test"
build_rails_app_test
