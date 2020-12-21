#!/bin/bash

setup_tmp() {
  cd /tmp
}

function prompt() {
  exit_code=$?
  echo $BASH_COMMAND
  echo "hello" > /dev/tty
  echo $@ > /dev/tty
}

PROMPT_COMMAND="echo hello > /dev/tty"

echo "hello again" > /dev/tty

expect() {
  eval $1 "${@:2}"
  if [ $? = 0 ]; then
    success
    printf "\e[32m.\e[0m" &> /dev/tty
  else
    failure
    printf "\e[31mF\e[0m" &> /dev/tty
  fi
}

success() {
  sed -i -r 's/([0-9]+),([0-9]+)/echo "$((\1+1)),\2"/ge' $temp_directory/results.txt
}

failure() {
  sed -i -r 's/([0-9]+),([0-9]+)/echo "\1,$((\2+1))"/ge' $temp_directory/results.txt
}
