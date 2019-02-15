cd /home/travis/docker-react
pwd
npm i
npm run build
docker stop $(docker ps -q --filter ancestor=dockerreactprod )
docker build -t dockerreactprod .
screen -dmS dockerreactprod docker run -p 5678:80 dockerreactprod
echo "started"