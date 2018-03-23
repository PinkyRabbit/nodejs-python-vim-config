![Vim image](https://github.com/PinkyRabbit/javascript-vim-config/blob/master/image.png "Vim on Ubuntu image")
# javascript-vim-config
My config for Vim. I'm JavaScript Node developer.

First of all want to say thanks to all authors of plugins. Awesome job!

## Keys
* `vim **<TAB>` - fzf called for directory
* `:FZF` - fzf in file
* `gf` inside `require("...")` to jump to source or module file
* `:Fixmyjs` - autofix code with ESLint
* `:Npm <command> [options..]` - use npm inside file
* `:Gist -s comment` - publish gist
* `:Gist -l` - get gists list
* `:Gist -c u1y4o34o234134` - open gist

## READthis.md:
You need `Vim 8+` and `vim-plug` installed. OS Ubuntu 16.04. I add templating engine `art-template` in config cuz I use it. You free to use what you want just fix it into your config.

I maked directory `~/.vim` as my main. All, `.vimrc`, directories `colors` and `autoload`, are placed here. 
Copy `.vimrc` to `~/.vim` and open it. Inside file make this command:
```
:source %
:PlugInstall
```

Symlinking `.vimrc` to home root by:
```
sudo ln -s ~/.vim/.vimrc .vimrc
```

## Color scheme :
I tryed some color schemes and best looking was [Material Monokai Color Scheme for Vim](https://github.com/skielbasa/vim-material-monokai) thats why I propose it to you.

Clone and copy both theme files in path:
```
./.vim/colors/
./.vim/autoload/airline/themes/
```

I dont using `YouCompleteMe` with tern. I tryed, but... it was not such good. Snippets for JS development mach better!

## File navigation
I use Unix system, thats why I use fzf. You need to install it [follow the instruction](https://github.com/junegunn/fzf):
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
Shortcut from guide:
- `COMMAND [DIRECTORY/][FUZZY_PATTERN]**<TAB>`

```sh
# Files under current directory
# - You can select multiple items with TAB key
vim **<TAB>

# Files under parent directory
vim ../**<TAB>

# Files under parent directory that match `fzf`
vim ../fzf**<TAB>

# Files under your home directory
vim ~/**<TAB>


# Directories under current directory (single-selection)
cd **<TAB>

# Directories under ~/github that match `fzf`
cd ~/github/fzf**<TAB>
```

Full description of Fuzzy for Vim [is here](https://github.com/junegunn/fzf.vim). You can add any option to config if you need.

## Snippets List:
* [html](https://github.com/honza/vim-snippets/blob/master/snippets/html.snippets)
* [full list of honza's snippets](https://github.com/honza/vim-snippets/tree/master/snippets)
(Honza's snippets commented! if you want to use it you must open it into `.vimrc`) 
* [ES6](https://github.com/epilande/vim-es2015-snippets)
* [React](https://github.com/epilande/vim-react-snippets)
* [Testing](https://github.com/alexbyk/vim-ultisnips-js-testing)

## Code formating
Most people are fans of `prettier`, but not me. I enjoy hard coding ESLint/AIRBnb-style. If you not - look to `prettier` + `neoformat` for Vim. That is strong bundle, but I go other way. I use `autoformat` + `fixmyjs`

## Gist
To use gist you need to set up your local gitconfig. Create token into your GitHub account with `gist` and add it to `.gist-vim` file
