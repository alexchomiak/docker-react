#!/bin/bash

# print outputs and exit on first failure
set -xe

if [ $TRAVIS_BRANCH == "master" ] ; then
	echo "deploying"
    # setup ssh agent, git config and remote
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/travis_rsa
	git config --global push.default matching
    git remote add deploy "travis@chom.es:/home/travis/docker-react"
	git push deploy master
else   	
	echo "oof"
fi
