
default: help
.PHONY: default

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Example:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make prepare'
	@echo
	@echo '	$$ make gpg'
	@echo
	@echo '	$$ make update'
	@echo
.PHONY: help




prepare:
	@./prepare.sh
.PHONY: prepare


gpg-setup:
	@./gpg-setup.sh
.PHONY: gpg-setup


repo-update:
	@./repo-update.sh
.PHONY: repo-update
