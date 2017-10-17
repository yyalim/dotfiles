alienaut dotfiles
=================

Good examples of configuration for machines uses tmux, vim and zsh.


Installition
------------

firstly, install tmux, vim, zsh to your computer.

```
# arch linux
sudo pacman -S tmux zsh vim

# debian
sudo apt-get install tmux zsh vim

# fedora
sudo dnf install tmux zsh vim

# macOS with homebrew
brew install tmux zsh vim
```

Install vim plug via curl
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Note: before going to next step don't forget to backup your own config files.

After installed required programs you have init a git repository in your home directory, after that add this repository's address to its remotes and pull it to your master.

```
git init
git remote add origin git@github.com:alienaut/dotfiles.git
git pull origin master
```

In vim switch to command mode and write ```:PlugInstall```, hit enter, and restart your lovely editor after plugins installed.

