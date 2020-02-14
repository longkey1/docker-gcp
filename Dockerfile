FROM google/cloud-sdk:latest

# Fix frontend not set error
ARG DEBIAN_FRONTEND=noninteractive

# For ansible add apt-repositry
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
&& apt-get update \
&& apt-get install -y ansible

# Install packages
RUN apt-get -y update && apt-get install -y \
apt-utils \
ansible \
build-essential \
curl \
gettext \
git \
gosu \
wget

COPY --from=hashicorp/terraform:light /bin/terraform /usr/local/bin/terraform
RUN chmod +x /usr/local/bin/terraform

# Set workspace
RUN mkdir /work

# Set Entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
