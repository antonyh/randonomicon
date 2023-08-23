#!/usr/bin/env bash
gem install bundler
gem update --system 3.2.3
bundle install
exec /usr/jekyll/bin/entrypoint jekyll serve
echo done