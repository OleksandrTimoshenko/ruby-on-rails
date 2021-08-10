FROM ruby:2.5.0
#MAINTAINER Yuriy Pasichynskiy <yuriy.pasichynskiy@teamvoy.com>

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn sqlite3

ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN rails webpacker:install

RUN chmod +x ./entrypoint.sh

EXPOSE 3000
