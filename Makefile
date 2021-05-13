IMAGE_NAME := alpine-texlive-ja

SRC := Dockerfile
CREATION_TIME := $(shell docker inspect $(IMAGE_NAME) -f {{.Created}} | xargs date +%s -d)
LATEST_MOD_TIME := $(shell echo $(SRC) | xargs -n 1 date +%s -r | awk '{if(m<$$1) m=$$1} END{print m}')

.PHONY:
run: build_paper

.PHONY: build_image
build_image:
	if [ -z $(CREATION_TIME) ] || [ $(LATEST_MOD_TIME) -ge $(CREATION_TIME) ]; then \
		docker build . -t $(IMAGE_NAME); \
	else \
		echo "Docker container image is ready up to date."; \
	fi

.PHONY: build_paper
build_paper:
	docker run -ti --rm -v $(PWD):/workdir $(IMAGE_NAME) make -f docker.mk
