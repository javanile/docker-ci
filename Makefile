
VERSION := 19.03.8

update:
	bash update.sh

build:
	docker build -t javanile/docker-ci:$(VERSION) $(VERSION)

test: update
	docker run --rm -v $${PWD}:/test -w /test javanile/docker-ci:$(VERSION) bash test.sh
