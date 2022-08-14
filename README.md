# How to Start

- Firstly, link the git repository to `$HOME/.vim`, link the vimrc file to `$HOME/.vimrc`:

```shell
$ ln -sT $PWD/Simple_Vimrc $HOME/.vim
$ ln -s $PWD/Simple_Vimrc/vimrc $HOME/.vimrc
```

- Secondly, install [vim-plug](https://github.com/junegunn/vim-plug) plugin manager.

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Alternatively, this step can be automatically done by adding the following codes into vim configuration file but before any `plug#begin()` call:

```
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
```

- Thirdly, the [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) plugin need more operations to make it work.

YCM is a vim plugin with a compiled component. After the previous instructions, you have installed the plugin but not compiled so that ycm server won't start to provide completion feature. 

The simplest step to compile YCM is

```shell
cd $HOME/.vim/plugged/YouCompletMe
python3 install
```

However, it's likely to encounter some errors in practice especially when you are compiling YCM with older vim or older Ubuntu release. It's better to refer official documentation for installation.

# File Tree

```
.
├── autoload
├── ftplugin
├── plugin
├── README
└── vimrc
```

- `autoload` folder is the place for `vim-plug` only right now
- `ftplugin` folder is the place for file type specified configuration
- `plugin` folder is the place for user defined configuration
