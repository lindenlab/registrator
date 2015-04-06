FROM registry.docker/debian
ENTRYPOINT ["/bin/registrator"]
ADD bin/registrator /bin/registrator
