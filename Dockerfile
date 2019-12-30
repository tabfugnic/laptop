FROM debian:testing

WORKDIR /usr/src/laptop
COPY . .
RUN debconf-set-selections < ./.circleci/keyboard.conf
RUN apt-get update; \
apt-get install -y locales apt-utils; \
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen; \
locale-gen; \
update-locale
RUN mkdir ~/.ssh; touch ~/.ssh/id_rsa.pub
RUN mkdir ~/.gnupg; touch ~/.gnupg/pubring.kbx
RUN apt-get update; apt-get install -y sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

CMD ./debian
