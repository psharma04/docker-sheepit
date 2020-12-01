FROM debian:stable-slim

MAINTAINER rbxii3

# RUN mkdir /usr/share/man/
RUN mkdir /usr/share/man/man1/


RUN apt update
RUN apt install -y wget apt-transport-https gnupg curl
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb buster main" | tee /etc/apt/sources.list.d/adoptopenjdk.list
run apt update && apt install -y adoptopenjdk-11-hotspot


ADD sheepit.sh /store/sheepit.sh
RUN chmod +x /store/sheepit.sh

WORKDIR /store

ENV user_name ""
ENV user_password ""
ENV cpu "0"

CMD ./sheepit.sh
