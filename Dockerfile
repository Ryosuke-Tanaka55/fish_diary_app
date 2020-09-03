FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /fish_diary_app
WORKDIR /fish_diary_app

COPY Gemfile /fish_diary_app/Gemfile
COPY Gemfile.lock /fish_diary_app/Gemfile.lock

RUN gem install bundler && bundle install
COPY . /fish_diary_app