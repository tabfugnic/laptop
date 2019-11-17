fancy_echo() {
    printf "\n\e[32m---------$1---------\e[0m\n"
}

error_echo() {
    printf "\n\e[31m---------$1---------\e[0m\n"
}

runner() {
    if [ -n "$2" ]; then
      fancy_echo "$2"
    fi

    if [ -z "$VERBOSE" ]; then
      $1 > ./logfile.txt 2>&1
    else
      $1
    fi
}

print_error_and_exit() {
  ret=$?
  [ $ret -ne 0 ] && tail ./logfile.txt >&2
  exit $ret
}
