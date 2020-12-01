FROM debian:stable-slim

MAINTAINER rbxii3

RUN apt update
RUN apt install -y openjdk-11-jdk-headless
RUN apt install -y curl wget
RUN apt install -y default-jdk
RUN apt install -y default-jre
RUN apt autoremove -y
ADD sheepit.sh /store/sheepit.sh
RUN chmod +x /store/sheepit.sh

WORKDIR /store

ENV user_name ""
ENV user_password ""
ENV cpu ""

CMD ./sheepit.sh
