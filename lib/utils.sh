fancy_echo() {
    printf "\n\e[32m---------$1---------\e[0m\n"
}

error_echo() {
    printf "\n\e[31m---------$1---------\e[0m\n"
}

apt_install() {
    fancy_echo "Install: $1"
    apt-get install -y "$1"
}
