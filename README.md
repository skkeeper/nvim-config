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

- Install vim-plug

Linux
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Windows (Powershell prompt)
```powershell 
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force
```

- Install ripgrep, fd and ag

Windows (chocolatey)
```bash
cinst ripgrep fd ag
```

Linux
```bash
sudo apt-get install ripgrep fd-find silversearcher-ag
```

The ripgrep package on the ubuntu repositories is currently having problems, run this instead:

```bash
wget https://github.com/BurntSushi/ripgrep/releases/download/12.1.0/ripgrep_12.1.0_amd64.deb -P /tmp/
sudo dpkg -i /tmp/ripgrep_12.1.0_amd64.deb
rm /tmp/ripgrep_12.1.0_amd64.deb
```


Based on: 
- https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f
- https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/.vimrc

