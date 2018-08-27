.PHONY: FORCE

DOTFILE_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DOTFILE_DIR := $(DOTFILE_DIR:/=)

default:
	true

dotfiles: .vimrc


.%:	$(DOTFILE_DIR)/home/dot.%
	ln -fsi $< $@
