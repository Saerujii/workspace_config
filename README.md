# My workspace config
This is the config I use to work on things
## Requirements:
- nvim
- packer.nvim (Will consider switching to some other)
- Wezterm
- tmux

## Installation:
- Clone this repo into your home dir
- With nvim open ```~/.config/nvim/lua/saeru/packer.lua``` file
- Execute ```:so``` command, followed by ```:PackerSync```. Let it install everything
- Reopen nvim and wait for treesitter and lsp to get installed. If something fails, open ```:checkhealth``` and see if you are missing any dependencies for the languages
- Now you can open Wezterm and tmux, to use nvim
