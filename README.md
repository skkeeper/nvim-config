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

- Install dependencies for LSP servers

```bash
npm install -g eslint markdownlint-cli stylelint write-good yarn
```

- Install LSP servers, run the following inside Neovim

```bash
:lua require("config/lspinstall").bootstrap()
```

## References:

- https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f
- https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/.vimrc
