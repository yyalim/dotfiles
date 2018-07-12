### Installation

Just clone it and create symlinks. 

``` 
$ ln -s /path/to/repo/.vimrc ~/.vimrc
$ ln -s /path/to/repo/.tmux.conf ~/.tmux.conf
```

If you are using nvim creating a symlink won't work. Just copy the config file into your nvim config folder. It is only redirecting to .vimrc file.

```
$ cp /path/to/repo/.config/nvim/init.vim ~/.config/nvim/init.vim
```

Or clone it into your home directory, but don't forget to backup your existed files first.

```
$ git clone git@github.com:alienaut/dotfiles.git ~/
```
