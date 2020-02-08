FROM google/cloud-sdk:latest

# Fix frontend not set error
ARG DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get -y update && apt-get -y install apt-utils build-essential curl gettext git wget

# Set workspace
RUN mkdir /work
