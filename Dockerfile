FROM debian:stable-slim

MAINTAINER rbxii3

# Create man folder for AdoptOpenJDK
RUN mkdir /usr/share/man/man1/

# Install wget, https support for APT, and cURL
RUN apt update
RUN apt install -y wget apt-transport-https gnupg curl

# Install openjdk from AdoptOpenJDK (openjdk 11, hotspot)
# NOTE: might switch to OpenJ9 because of a better memory footprint therefore better containerised performance
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN echo "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb buster main" | tee /etc/apt/sources.list.d/adoptopenjdk.list
run apt update && apt install -y adoptopenjdk-11-hotspot

# Add sheepit script launcher and give it execute permissions
ADD sheepit.sh /store/sheepit.sh
RUN chmod +x /store/sheepit.sh

# Set working directory
WORKDIR /store

# Set environment variables: username, password, cpu core count
ENV user_name ""
ENV user_password ""
ENV cpu "0"

# Run the script on container launch
CMD ./sheepit.sh
