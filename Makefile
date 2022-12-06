# https://suva.sh/posts/well-documented-makefiles/#simple-makefile
.DEFAULT_GOAL:=help
SHELL:=/bin/bash
PROTOBUF:=/opt/homebrew/Cellar/buf/1.9.0/bin/buf

.PHONY: help deps clean build watch

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

list:  ## Check dependencies
	@$(PROTOBUF) ls-files

lint:  ## Check dependencies
	@$(PROTOBUF) lint

build: ## Build the project
	@$(PROTOBUF) generate

