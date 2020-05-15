FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV BUNDLER_VERSION=2.1.4

RUN bundle install

COPY . /app
