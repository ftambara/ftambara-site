PROJECT_DIR = .

.PHONY: no-dirty
no-dirty:
	@git diff --exit-code || (echo "There are uncommitted changes. Please commit or stash them first." && exit 1)

.PHONY: prod/deploy
.ONESHELL:
prod/deploy: no-dirty
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
