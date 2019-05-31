IMAGE:=docker.io/gbbirkisson/httpie
TAG:=1.2

build:
	docker build -t ${IMAGE}:${TAG} .

push: build
	docker tag ${IMAGE}:${TAG} ${IMAGE}:latest
	docker push ${IMAGE}:${TAG}
	docker push ${IMAGE}:latest
