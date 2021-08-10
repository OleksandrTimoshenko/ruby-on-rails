# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version -> 2.5.0

* System dependencies -> see Gemfile and Dockerfile

* Deployment instructions

docker build -t ruby_backend -f ./deploy/docker/Dockerfile .

docker-compose -f ./deploy/docker/docker-compose.yaml up