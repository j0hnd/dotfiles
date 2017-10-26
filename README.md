# Description

forked project from my old pal, so the ui feel for this vimrc is navigate files/code through fzf search, see shortcuts.md

# Dotfiles

Collection my configurations

Some features:
- Iterm configuration
- Git vim integration
- vim and tmux navigation using h/j/k/l
- Code searching with ctags including your rails project's gems

## Installation

    rm -rf .vim
    rm .vimrc
    rm .tmux.conf

    git clone git@github.com:rcclemente/dotfiles.git dotfiles
    ln -s dotfiles/vimrc ~/.vimrc
    ln -s dotfiles/tmux.conf ~/.tmux.conf

#### MacVim (optional)

    brew install macvim --env-std --with-override-system-vim

#### Fonts

    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

#### Update Iterm

  - Settings

![Iterm Font Config](https://github.com/rcclemente/dotfiles/blob/master/images/tmux_powerline_font.png "Inconsolata")

![Iterm Allow terminal apps to clipboard](https://github.com/rcclemente/dotfiles/blob/master/images/iterm_allow_tmux_vim_to_copy_clipboard.png)

  - Install the theme

        $ cd dotfiles
        $ cp space-vim-dark.vim ~/.vim/colors

  - Activating theme

    1. iTerm2 > Preferences > Profiles > Colors Tab
    2. Open the Color Presets... drop-down in the bottom right corner
    3. Select Import... from the list
    4. Select the space-vim-dark.itermcolors file
    5. Select the space-vim-dark from Color Presets

#### Install Vundle

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#### Install Dracula for vim

    mkdir -p ~/.vim/colors
    wget https://raw.githubusercontent.com/dracula/vim/master/colors/dracula.vim
    mv dracula.vim ~/.vim/colors/

#### Ctags

  - Install

    `brew install ctags`

  - Create the tags for your local ruby/rails project

    ``ctags --exclude=log --exclude=.git --recurse . `bundle show --paths` ``

  - In vim to search for a definition of a tag press `<C-]>`

## Vim plugins

#### Search for text in file

    brew install ack
    brew install the_silver_searcher

#### Installing/Updating Vim

    vim +PluginInstall +qall

#### Docker files

    docker pull j0hnd/apache-php

## Raw links

https://raw.githubusercontent.com/rcclemente/dotfiles/master/tmux.conf


