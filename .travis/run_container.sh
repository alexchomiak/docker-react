cd /home/travis/docker-react
pwd
docker stop $(docker ps -q --filter ancestor=dockerreactprod )
docker build -t dockerreactprod .
docker run -p 5678:80 dockerreactprod
echo "started"