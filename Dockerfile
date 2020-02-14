FROM google/cloud-sdk:latest

# Fix frontend not set error
ARG DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get -y update && apt-get -y install apt-utils build-essential curl gettext git gosu wget

# Add docker user
RUN useradd -m docker
RUN usermod -aG sudo docker

# Set workspace
RUN mkdir /work && chmod docker:docker

# Switch to docker user
USER docker
