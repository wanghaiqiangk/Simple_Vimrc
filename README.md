# Install Vim

## For Ubuntu User

It's possible to install via APT.

```shell
$ sudo apt install vim
```

If you need the ability to copy&paste from system clipboard, you'd better to install Vim with `xterm_clipboard` enabled.

```shell
$ sudo apt install vim-gtk3
```

If you need the latest version of Vim, installing from PPA is a quick method.

```shell
$ sudo add-apt-repository ppa:jonathonf/vim
$ sudo apt update
$ sudo apt install vim
```

If you find a compilation from source suits your situation, then refer to [this](https://www.vim.org/git.php) for instructions on how to compile.

It would be recommended to install Python >= 3.6 with `--enable_shared` which is depended by Vim and some of plugins used by Vim.

# Configuration

The basic idea is to link `vimrc` (file in the repo) to `$HOME/.vimrc` and `Simple_Vimrc` (the repo itself) to `$HOME/.vim`. This is done in the `install.sh` script. Therefore, all you need is to run this script.

```shell
git clone https://github.com/wanghaiqiangk/Simple_Vimrc.git
cd Simple_Vimrc && ./install.sh
```

# Plugin Manager

[vim-plug](https://github.com/junegunn/vim-plug) is used.

This should be installed along with Configuration. But if you want to update or reinstall, you can manually download it.

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Alternatively, this step can be automatically done by adding the following codes into vim configuration file but before any `plug#begin()` call:

```vimscript
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
```

# For Neovim User

If you actually use [Neovim](https://neovim.io/), the original Vim configuration and plugins can be smoothly migrated to Neovim. The transition is documented in [Transitioning from vim](https://neovim.io/doc/user/nvim.html#nvim-from-vim).
