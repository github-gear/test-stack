#!/bin/sh

git clone https://github.com/github-gear/fake-fs.git /fs

cd /fs
git checkout "$BRANCH"
gem install bundler && bundle install

./dynamic_test # stands for rspec, exist to show pass test in master and fail test in staging
