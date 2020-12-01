FROM adoptopenjdk/openjdk11-openj9:alpine-slim

# Create Directories
RUN mkdir /store
ADD runfile /store/runfile

# Install cURL and the full GREP package, then set permissions on the runfile
RUN apk update && apk --no-cache add curl grep bash  && chmod +x /store/runfile
RUN apk add --no-cache --update tar bzip2 freetype mesa-dev mesa libxi
# Set workdir
WORKDIR /store

# Set environment variables: username, password, cpu core count
ENV user_name ""
ENV user_password ""
ENV cpu "0"

# Run the script on container launch
CMD /store/runfile
