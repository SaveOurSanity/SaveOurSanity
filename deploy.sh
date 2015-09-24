#!/bin/sh

git fetch
git reset --hard origin/$(git branch | sed -n '/\* /s///p')
bundle
bundle exec rake db:create
bundle exec rake db:migrate
killall thin
sleep 2
killall thin
SECRET_KEY_BASE=$SECRET_KEY_BASE GITHUB_ID=$GITHUB_ID GITHUB_CLIENT_SECRET=$GITHUB_CLIENT_SECRET bundle exec thin start -s1
bundle exec whenever --update-crontab SoS --set environment=production --roles app
