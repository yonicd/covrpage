#!/bin/sh

check_key() {
 echo $GH_TOKEN 
}

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_test_files() {
  git checkout -b covrpage
  git add test.txt
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add master-covrpages https://yonicd:${GH_TOKEN}@github.com/yonicd/covrpage.git
  git push --quiet --set-upstream master-covrpages covrpage
}

setup_git
commit_test_files
upload_files