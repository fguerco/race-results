#!/usr/bin/env sh

set -e

echo Running tests...
bundle exec rspec --format documentation

echo Tests Ok. Running program...
ruby src/app.rb

echo Done
