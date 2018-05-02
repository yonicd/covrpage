#!/bin/bash

set -x
if [ $TRAVIS_BRANCH == 'master' ] ; then

  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"

  git checkout -b covrpage
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"

  git remote add deploy https://yonicd:${GH_TOKEN}@github.com/yonicd/covrpage.git
  git push --force deploy covrpage -v

else
    echo "Not deploying, since this branch isn't master."
fi