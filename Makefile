DGREEN := "$$(tput setaf 2)"
BLUE := "$$(tput setaf 4)"
TEAL := "$$(tput setaf 6)"
LGREEN := "$$(tput setaf 10)"
RED := "$$(tput setaf 160)"
RESET := "$$(tput sgr0)"
usage:
	@echo ""
	@echo " $(TEAL)┏━━━━━━━━━━━━━━━━━━━━━━━━━┓$(RESET)"
	@echo " $(TEAL)┃ $(RESET)React Development Stack$(TEAL) ┃$(RESET)"
	@echo " $(TEAL)┡━━━━━━━━━━━━━━━━━━━━━━━━━┩$(RESET)"
	@echo " $(TEAL)│ $(RESET)Available Commands:$(TEAL)     │$(RESET)"
	@echo " $(TEAL)╰─┬───────────────────────╯$(RESET)"
	@echo "   $(TEAL)╰─$(RESET) $(DGREEN)up$(RESET) - launch react development stack"
	@echo ""

MKFILE := $(abspath $(lastword $(MAKEFILE_LIST)))
MKDIR  := $(dir $(MKFILE))

GIT_BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

# Shortcuts
up:
	@echo "$(DGREEN)Launching React Development Containers...$(RESET)";\
	if [ ! -d app ]; then\
	    echo "$(RED)ERROR$(RESET): folder './app' does not contain a React application!";\
	else\
        COMPOSE_IGNORE_ORPHANS=True docker-compose --log-level ERROR -p docker-react up -d;\
        echo "$(LGREEN)Done!$(RESET)\n\r";\
	fi;
