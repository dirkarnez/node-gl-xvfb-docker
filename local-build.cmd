docker build -t node-gl-xvfb-docker . &&^
docker run --rm -it -p5000:5000 node-gl-xvfb-docker
pause
