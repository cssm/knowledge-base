OK    := \033[32m
ERR   := \033[31m
RESET := \033[0m

.PHONY: all
all: update

.PHONY: update
update:
	@git add .
	@git commit -m "update"
	@git push
	@echo "$(OK)Wiki Updated!$(RESET)"