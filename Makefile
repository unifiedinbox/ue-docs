TAG=unifiedinbox/ue-docs
NAME=ue-docs

start: docker start $(NAME)
	echo Starting

build:
	docker build -t=$(TAG) .

run: 
	docker run -d --name $(NAME) -p 4567:4567 $(TAG)

stop:
	docker kill $(NAME)

remove: stop
	docker rm $(NAME)

restart: remove build run
	echo Restarting
