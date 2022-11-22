# dotfiles
## Introduction
This repository serves as my way to help me set up and maintain my Linux.
It takes the effort out of installing everything manually.
Everything needed to install my preferred setup of Xubuntu is detailed in this readme.
Feel free to explore, learn and copy parts for your own dotfiles. Enjoy!

## Installation
Clone the repository to your computer.
My path recommendation is `~/.dotfiles`.

```bash
git clone https://github.com/MichaelZaslavsky/dotfiles.git ~/.dotfiles
```

Add symbolic links to the `.bashrc`, `.vimrc`, `.tmux.conf` files and its related files.

```bash
ln -s ~/.dotfiles/bashrc/.bashrc ~/.bashrc
ln -s ~/.dotfiles/bashrc/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/.profile ~/.profile
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vimrc/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vimrc/*.vim ~/.vim/plugin
ln -s ~/.dotfiles/vimrc/UltiSnips/* ~/.vim/UltiSnips/
ln -s ~/.dotfiles/pythonx/snippet_helpers.py ~/.vim/pythonx/snippet_helpers.py
ln -s ~/.dotfiles/pythonx/global_extra_conf.py ~/global_extra_conf.py
```

## Tools and dependencies
### bash
#### bash-it
[bash-it](https://github.com/Bash-it/bash-it) is a collection of community Bash commands and scripts.
Includes autocompletion, themes, aliases, custom function, and more.

```bash
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
Run `~/.bash_it/install.sh`
Reload bashrc by `source ~/.bashrc`
```

#### thefuck

[thefuck](https://github.com/nvbn/thefuck) is a manificent app, that corrects errors in previous console commands.

```bash
pip install --user thefuck
```

#### Global search

A great code-searching tool is the silver searcher (ag "{text to search}").

```bash
sudo apt install silversearcher-ag
```

### tmux
#### tpm

[Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

- Start tmux
- Launch tmux and hit `C-a :source-file ~/.tmux.conf` or `C-a + r` to reload tmux (Note C-a is my configured tmux prefix).
- Hit `C-a I` to fetch any plugins.

#### powerline
[Powerline](https://github.com/powerline/powerline) is a statusline plugin for vim, and provides statuslines and prompts

Make sure [python](https://www.python.org) is installed and follow those steps:

```bash
sudo add-apt-repository universe
pip install powerline
pip install --user powerline-status
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```

After the installations, a restart to the terminal emulator will probably be required.
Starting `tmux` should then display a pretty and helpful powerline.

#### vim
[Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) is a free and open-source, screen-based text editor program.

[vim-plug](https://github.com/junegunn/vim-plug) is my Vim Plugin Manager.

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Open the .vimrc file and install its plugins:

```bash
vim ~/.vimrc
:PlugInstall
```

Complete the [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) plugin installations:

```bash
sudo apt install cmake
cd ~/.vim/plugged/YouCompleteMe
python3 install.py
```

Complete the [fzf](https://github.com/junegunn/fzf) plugin installations:

```bash
sudo apt install fzf && fzf
```

### fonts

- Download a [Nerd Font](https://www.nerdfonts.com/)
- Unzip and copy to `~/.fonts`
- Run `fc-cache -fv` to manually rebuild the font cache
