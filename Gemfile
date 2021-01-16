image: ruby:latest

variables:
  JEKYLL_ENV: production
LC_ALL: C.UTF-8

before_script:
- gem install bundler
- bundle install

test:
  stage: test
script:
- bundle exec jekyll build -d test
artifacts:
  paths:
- test
except:
- master

pages:
  stage: deploy
script:
- bundle exec jekyll build -d public
artifacts:
  paths:
- public
only:
- master




# source "https://rubygems.org"

# gem "jekyll", "~> 3.9"
# gem "html-proofer", "~> 3.10"
# gem "kramdown-parser-gfm"
