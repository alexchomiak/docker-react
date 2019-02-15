#!/bin/bash

# print outputs and exit on first failure
set -xe

if [ $TRAVIS_BRANCH == "master" ] ; then
	echo "deploying"
	echo $(pwd)
    # setup ssh agent, git config and remote
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/travis_rsa
	git config --global push.default matching
    git remote add deploy "travis@ssh-proxy.chom.es:docker-react"
	git push -f deploy master 


	ssh -i ~/.ssh/travis_rsa travis@ssh-proxy.chom.es < ./run_container.sh
	
	
else   	
	echo "oof"
fi
