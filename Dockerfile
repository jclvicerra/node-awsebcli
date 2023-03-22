# https://github.com/nikolaik/docker-python-nodejs/blob/master/versions.json
# {
#       "key": "python3.10-nodejs14-slim",
#       "python": "3.10",
#       "python_canonical": "3.10.5",
#       "python_image": "3.10.5-slim",
#       "nodejs": "14",
#       "nodejs_canonical": "16.17.1",
#       "distro": "slim"
#     },

# python: 3.10
# nodejs: 14.17.1
# npmversion: 6.14.15

FROM python:3.10.10-slim

ENV POETRY_HOME=/usr/local
# Install node prereqs, nodejs and yarn
# Ref: https://deb.nodesource.com/setup_14.x
# Ref: https://yarnpkg.com/en/docs/install
RUN \
  apt-get update && apt-get install wget gnupg2 -y && \
  echo "deb https://deb.nodesource.com/node_14.x buster main" > /etc/apt/sources.list.d/nodesource.list && \
  wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -yqq git nodejs=$(apt-cache show nodejs|grep Version|grep nodesource|cut -c 10-) yarn && \
  apt-mark hold nodejs && \
  pip install -U pip && pip install pipenv && \
  pip install --upgrade awsebcli awscli s3cmd && \
  npm i -g npm@^6.14.18 && \
  wget -q -O - https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python - && \
  rm -rf /var/lib/apt/lists/*
