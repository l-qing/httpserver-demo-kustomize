.PHONY: default
default: help

##@ General

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Development
OS_NAME=$(shell uname -s)
SED_I_PARAMETER=
ifeq ($(OS_NAME), Linux)
  SED_I_PARAMETER=
endif
ifeq ($(OS_NAME), Darwin)
  SED_I_PARAMETER=""
endif


IMAGE?=httpserver
IMAGE_TAG?=latest
update-deployment-image-tag: ## update image tag
	sed -i $(SED_I_PARAMETER) "s|\(^[ \t]*image: .*:\).*|\1${IMAGE_TAG}|g" deployment.yaml

update-deployment-image: ## update image and tag
	sed -i $(SED_I_PARAMETER) "s|\(^[ \t]*\)image: .*|\1image: ${IMAGE}:${IMAGE_TAG}|g" deployment.yaml

