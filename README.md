# javascript-vim-config
My config for Vim. I'm JavaScript Node developer. Also use in my job pythone.

First of all want to say thanks to all authors of plugins. Awesome job!

![Vim image](https://github.com/PinkyRabbit/javascript-vim-config/blob/master/image.png "Vim on Ubuntu image")
## Keys
* `:Npm <command> [options..]` - use npm inside file
* `:Gist -s comment` - publish gist
* `:Gist -l` - get gists list
* `:Gist -c u1y4o34o234134` - open gist
* `:Gist -d` delete current opened gist

## READthis.md (installation):
You need `Vim 8+` installed. Just clone this repo to your `~/.vim` directory:
```
[pinkyrabbit@mypc ~]$ git clone https://github.com/PinkyRabbit/nodejs-python-vim-config.git .vim
```

Open your `~/.vim/.vimrc` file and installation will start *automatically*:
```
vim ~/.vim/.vimrc
```

Wait until it end. Symlinking `.vimrc` to home root by:
```
sudo ln -s ~/.vim/.vimrc .vimrc
```

## YouCompleteMe
The most powerfull feature for js coding is snippents. But we need YCM. It is autocomplete. We install autocomplete for JS and Pythone with commands:
```sh
mkdir -p ~/.vim/bundle/YouCompleteMe/third_party/ycmd
cd ~/.vim/bundle/YouCompleteMe
sudo chmod 777 -R ~/.vim/bundle/YouCompleteMe/third_party/ycmd
./install.py --js-completer
sudo chmod 555 -R ~/.vim/bundle/YouCompleteMe/third_party/ycmd
```
If you know other path to install js-completer - you are welcome.

## Color scheme :
I tryed some color schemes and best looking was [Material Monokai Color Scheme for Vim](https://github.com/skielbasa/vim-material-monokai) thats why I propose it to you. I included it in repo. Hope Steven Kielbasa will agree with decision.

## File navigation
~~Disabled now
I use `Unite` for file navigation. This is very powerfull tool, but most documentation maked on japanise. But this plugin even out of the box sooooo good that you dont need any documentanion atall. Just type `:Unite` and you in menu.~~

## Snippets List:
I dont using `YouCompleteMe` with tern. I tryed, but... it was not such good. Snippets for JS development mach better!
* [html](https://github.com/honza/vim-snippets/blob/master/snippets/html.snippets)
* [full list of honza's snippets](https://github.com/honza/vim-snippets/tree/master/snippets)
(Honza's snippets commented! if you want to use it you must open it into `.vimrc`) 
* [ES6](https://github.com/epilande/vim-es2015-snippets)
* [React](https://github.com/epilande/vim-react-snippets)

I created [cheatsheet](https://github.com/PinkyRabbit/my-cheatsheets-A3-A2/blob/master/snippets%20Vim-React%20A2.docx) for fast lerning hotkeys.
* [Testing](https://github.com/alexbyk/vim-ultisnips-js-testing)

## Code formating
Most people are fans of `prettier`, but not me. I enjoy hard coding ESLint/AIRBnb-style. If you not - look to `prettier` + `neoformat` for Vim. That is strong bundle, but I go other way. I use `autoformat` + `fixmyjs`

## Gist
To use gist you need to set up your local gitconfig. Create token into your GitHub account with `gist` and add it to `.gist-vim` file
