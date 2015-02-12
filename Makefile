NAME=registrator
HARDWARE=$(shell uname -m)
VERSION=0.4.0

build: release
	docker build -t registry.docker/build/registrator:latest .

release:
	rm -rf release
	mkdir release
	GOOS=linux /var/cache/drone/bin/godep go build -o release/$(NAME)
	cd release && tar -zcf $(NAME)_$(VERSION)_linux_$(HARDWARE).tgz $(NAME)
	GOOS=darwin /var/cache/drone/bin/godep go build -o release/$(NAME)
	cd release && tar -zcf $(NAME)_$(VERSION)_darwin_$(HARDWARE).tgz $(NAME)
	rm release/$(NAME)
	echo "$(VERSION)" > release/version
	echo "progrium/$(NAME)" > release/repo
	gh-release # https://github.com/progrium/gh-release

.PHONY: release
