DOCKER_IMAGE ?= 7.4-fpm-alpine
TEMPLATE ?= 7.4-fpm-alpine
IMAGE_TAG ?= noitran/php-base:7.4-fpm-alpine-latest

build:
	sed -e 's/%%DOCKER_IMAGE%%/$(DOCKER_IMAGE)/g' $(TEMPLATE)/Dockerfile.template > $(TEMPLATE)/Dockerfile
	docker build -t $(IMAGE_TAG) $(TEMPLATE)
.PHONY: build

test:
	GOSS_FILES_PATH=$(TEMPLATE) dgoss run -t $(IMAGE_TAG)
.PHONY: test

clean:
	rm -rf */Dockerfile
.PHONY: clean

docker-push:
	docker push $(IMAGE_TAG)
.PHONY: docker-push
