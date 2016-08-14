default:
	ros -l simpleapp.asd -s simpleapp run
build:
	ros build simpleapp.ros
setup:
	apt-get -y install libmysqlclient-dev mysql-client libev4
	apt-get autoremove && apt-get clean

.PHONY: default build setup

