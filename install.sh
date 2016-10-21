#!/bin/sh

if ! hash brew 2>/dev/null; then
  echo "Homebrew is not installed. Install now..."
  $RUBY -e "$(curl -fsSL $HOMEBREW_URL)"
else
  echo "Homebrew is already installed."
fi

echo "Install serverkit and its dependencies"
sudo which bundle > /dev/null || sudo gem install bundler
sudo bundle install

echo "serverkit apply"
sudo bundle exec serverkit apply recipe.yml.erb --variables=variables.yml
