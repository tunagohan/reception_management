FROM ruby:2.6.3-stretch
LABEL maintainer "k-waragai <kazuxtuna@gmail.com>"

RUN apt-get update -qq

RUN apt-get install -y build-essential libpq-dev nodejs

RUN mkdir -p /app
WORKDIR /app

RUN gem install bundler

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN bundle install

ADD . /myapp
