#!/bin/bash

source lib/utils.sh
source tests/helper.sh $temp_directory

build_rails_app_test() {
  setup_ruby
  expect gem install rails

  # Create test app
  expect "rails new test_app"
  cd test_app

  expect bundle install

  # Create an article
  expect rails generate model Article content title

  # run migration
  expect rake db:migrate

  # run tests
  expect rake
}

setup_ruby() {
  . /usr/local/share/chruby/chruby.sh
  . /usr/local/share/chruby/auto.sh

  chruby ruby
}

fancy_echo "Build Rails App Test"
build_rails_app_test
