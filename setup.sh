#!/usr/bin/env bash

if ! hash bundle 2>/dev/null; then
  gem install bundler
fi

if ! hash node 2>/dev/null; then
  brew install node
fi

if ! hash grunt 2>/dev/null; then
  npm install -g grunt-cli
fi

if ! hash redis-server 2>/dev/null; then
  brew install redis
fi

npm install

bundle install

grunt test
