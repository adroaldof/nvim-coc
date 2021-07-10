# NeoVim

This is a highly opinionated [NeoVim](https://neovim.io/) configurations file

It is using [Vim-Plug](https://github.com/junegunn/vim-plug) as plugin manager

Bellow are listed some installed plugins:

- [coc](https://github.com/neoclide/coc.nvim)
- [fzf](https://github.com/junegunn/fzf)
- [indentLine](https://github.com/Yggdroot/indentLine)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [tcomment](https://github.com/tomtom/tcomment_vim)
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [SnipMate](https://github.com/garbas/vim-snipmate)


## Install NeoVim

Follow the steps from https://github.com/neovim/neovim/wiki/Installing-Neovim

## Add a alias

Add to your `.bashrc` or `.zshrc`

```bash
alias vim=nvim
```

## Install NVM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# add the follow to the .bashrc if it is not there yet
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# install a version
nvm install stable
```

## Clone this configurations

```bash
mkdir -p .config/nvim
git clone https://github.com/adroaldof/nvim.git .
```

## Run CocPlugins


Open NeoVim and type the follow commands

```bash
:PlugInstall
:CocInstall coc-explorer
```

---
Enjoy it :+1:
