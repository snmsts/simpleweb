tagname=simple-common-lisp
default:
	ros -l simpleapp.asd -s simpleapp run
build:
	ros build app.ros
docker:
	qlot install
	qlot exec make build
	docker build -f Dockerfile -t $(tagname) .
clean:
	rm app
setup-ubuntu:
	apt-get -y install libmysqlclient-dev mysql-client libev4
	apt-get autoremove && apt-get clean
setup2:
	apk add --update mariadb-dev
	apk add --update libev

.PHONY: default build setup docker
