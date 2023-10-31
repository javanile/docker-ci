
VERSION := 20.10.24

update:
	bash update.sh

build:
	docker build -t javanile/docker-ci:$(VERSION) $(VERSION)

test: update
	docker run --rm \
		-e GITLAB_DEPLOY_KEY=deploy_key \
		-e GITLAB_USER_EMAIL=bianco@javanile.org \
		-v $${PWD}:/test -w /test javanile/docker-ci:$(VERSION) bash test.sh

release: build
	git add .
	git commit -am "New release" && true
	git push
	docker push javanile/docker-ci:$(VERSION)
