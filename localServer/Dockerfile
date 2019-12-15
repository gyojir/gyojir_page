FROM ruby:2.3.4

ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app
WORKDIR /app
ADD app/Gemfile /app/Gemfile
ADD app/Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY app /app