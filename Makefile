# Makefile for installing dotfiles

# Defining shell to be used
SHELL := /bin/bash

# Default target executed when no arguments are given to make.
default_target: install

# Phony targets
.PHONY: install link update_vim_modules

install:
	@mkdir -p ~/.vim/autoload
	@curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	@echo "Installing custom plugins for Vim"
	@git submodule update --init --recursive
	@ln -sf $(PWD)/vim_plugins ~/.vim/bundle
	@$(MAKE) link

link:
	@for file in $(shell find . -type f -not -path './.git/*' -not -name 'Makefile' -not -name 'README.md'); do \
		target=$$HOME/$${file:2}; \
		if [ -e $$target ]; then \
			if cmp -s $$file $$target; then \
				echo "identical $$target"; \
			else \
				echo -n "overwrite $$target? [ynaq] "; \
				read answer; \
				if [ "$$answer" = "a" -o "$$answer" = "y" ]; then \
					rm -rf $$target; \
					ln -sf $(PWD)/$${file:2} $$target; \
				elif [ "$$answer" = "q" ]; then \
					exit; \
				else \
					echo "skipping $$target"; \
				fi; \
			fi; \
		else \
			echo "linking $$target"; \
			ln -sf $(PWD)/$${file:2} $$target; \
		fi; \
	done


update_vim_modules:
	@git submodule update --init --recursive
