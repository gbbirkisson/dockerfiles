BUILDER_NAME:=mybuilder
REPO:=gbbirkisson
LATEST_BUILD_ARGS?="--no-cache"

prepare-builder:
	docker run --rm --privileged docker/binfmt:a7996909642ee92942dcd6cff44b9b95f08dad64

create-builder:
	docker buildx create --name ${BUILDER_NAME}
	docker buildx use ${BUILDER_NAME}
	docker buildx inspect --bootstrap

build:
	test ${IMAGE}
	test ${TAG}
	test ${PLATFORM}
	docker buildx build \
		${BUILD_ARGS} \
		--platform linux/amd64,linux/arm64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6 \
		--push \
		-t ${REPO}/${IMAGE}:${TAG} \
		-f ${IMAGE}/Dockerfile \
		${IMAGE}

build-latest:
	TAG=latest BUILD_ARGS="${LATEST_BUILD_ARGS}"  $(MAKE) build

build-tag:
	$(MAKE) build-latest
	TAG=$(shell cat ${IMAGE}/tag) $(MAKE) build

# Docker files

.PHONY: httpie
httpie:
	IMAGE=httpie PLATFORM="linux/amd64,linux/arm64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6" $(MAKE) build-tag