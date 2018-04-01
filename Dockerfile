FROM ruby:2.4.3

RUN apt-get update && apt-get -y install curl git nano

RUN mkdir /app
RUN mkdir /app/dispatch
WORKDIR /app/dispatch

ADD Gemfile /app/dispatch/
ADD Gemfile.lock /app/dispatch/

RUN cd /app/dispatch && bundle install

RUN apt-get -y install nodejs

ADD . /app/dispatch/
