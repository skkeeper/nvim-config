# Neovim

## Install

- Clone this repo

Linux

```bash
git clone https://github.com/skkeeper/nvim-config.git ~/.config/nvim
```

Windows

```bash
git clone https://github.com/skkeeper/nvim-config.git %APPDATA%/../Local/nvim
```

- Install nvim python 3 support

```bash
pip install neovim
```

- Install javascript language servers

```bash
npm install -g eslint
```

- Install ripgrep, fd and ag

Windows (chocolatey)

```bash
cinst ripgrep fd ag
```

Linux

```bash
sudo apt-get install ripgrep fd-find silversearcher-ag ripgrep
```

## Language servers

Inside nvim run the following:

```bash
:LspInstall lua
:LspInstall vim
:LspInstall diagnosticls
:LspInstall typescript
:LspInstall java
:LspInstall css
:LspInstall html
```

## References:

- https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f
- https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/.vimrc
