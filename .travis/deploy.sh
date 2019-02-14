#!/bin/bash

# print outputs and exit on first failure
set -xe

if [ $TRAVIS_BRANCH == "master" ] ; then

    # setup ssh agent, git config and remote
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/travis_rsa
    git remote add deploy "travis@chom.es:/home/travis/docker-react"
    git config user.name "Travis CI"
    git config user.email "alex.chomiak@gmail.com"

    # commit compressed files and push it to remote
    #rm -f .gitignore
    #cp .travis/deployignore .gitignore
    git add .
    git status # debug
    git commit -m "Deploy compressed files"
    git push -f deploy HEAD:master
else
echo "oof"
fi
