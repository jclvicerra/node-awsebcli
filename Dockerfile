FROM node:10.16.0

RUN apt-get update

# Install python
RUN \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install awsebcli
RUN pip install --upgrade awsebcli awscli s3cmd
