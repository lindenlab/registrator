FROM registry.docker/debian
ADD registrator /bin/registrator
ENV DOCKER_HOST unix:///tmp/docker.sock
ENTRYPOINT ["/bin/registrator"]
