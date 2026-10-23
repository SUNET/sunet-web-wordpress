VERSION:=1.1.0
NAME:=sunet-web-wordpress

all: build push
build:
	docker build --platform=linux/amd64 --no-cache=true -t $(NAME) .
	docker tag $(NAME) docker.sunet.se/sunet/$(NAME):$(VERSION)
dev:
	docker build -f Dockerfile.dev --no-cache=true -t $(NAME) .
	docker tag $(NAME) docker.sunet.se/sunet/$(NAME):$(VERSION)
update:
	docker build --platform=linux/amd64 -t $(NAME) .
	docker tag $(NAME) docker.sunet.se/sunet/$(NAME):$(VERSION)
push:
	docker push docker.sunet.se/sunet/$(NAME):$(VERSION)
