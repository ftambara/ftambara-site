PROJECT_DIR = .

define confirm
	@echo "Are you sure you want to $(1)? [y/n] "
	@read -r response; \
	if [ "$$response" != "y" ]; then \
		echo "Aborted."; \
		exit 1; \
	fi
endef

.PHONY: no-dirty
no-dirty:
	@git diff --exit-code || (echo "There are uncommitted changes. Please commit or stash them first." && exit 1)

.PHONY: prod/deploy
.ONESHELL:
prod/deploy: no-dirty
	@$(call confirm,"deploy to production")
	@echo "Building the production image"
	@docker --context ftambara-site compose \
		--project-directory $(PROJECT_DIR) \
		--env-file .env \
		--file compose.prod.yml \
		build
	@docker --context ftambara-site compose \
		--project-directory $(PROJECT_DIR) \
		--env-file .env \
		--file compose.prod.yml \
		up -d nginx
