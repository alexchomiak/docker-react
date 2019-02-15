cd /home/travis/docker-react
pwd
docker stop alexchomiak/docker-react
docker build -t alexchomiak/docker-react .
docker run -p 5678:80 alexchomiak/docker-react