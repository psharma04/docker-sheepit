FROM debian:latest

MAINTAINER rbxii3

RUN \
  apt update && apt install -y --no-install-recommends \
  default-jre \
  curl \
  wget  

ADD sheepit.sh /store/sheepit.sh
RUN chmod +x /store/sheepit.sh

WORKDIR /store

ENV user_name ""
ENV user_password ""
ENV cpu ""

CMD ./sheepit.sh
