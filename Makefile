.PHONY: serve test deploy help doctor-setup doctor-build
PORT ?= 8123

help:
	@grep -E "^[a-zA-Z_-]+:.*?## .*$$" $(MAKEFILE_LIST) | awk "BEGIN{FS=\":.*?## \"}{printf \"  %-10s %s\\n\",\$$1,\$$2}"

serve: ## Serve the presentation on http://127.0.0.1:$(PORT)
	python3 -m http.server $(PORT)

test: ## Validate the static presentation
	python3 scripts/check.py

deploy: ## Publish to about.ifuri.com (Plesk)
	bash scripts/deploy-plesk.sh

doctor-build: ## Build check for diagnostics
	python3 -m py_compile scripts/check.py
	@echo "Build check successful"

doctor-setup: ## Bootstrap the environment for diagnostics
	python3 --version
