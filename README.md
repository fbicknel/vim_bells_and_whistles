vim_bells_and_whistles
======================

My .vim directory with a bunch of submodules and a vimrc that works with them

Clone this to ~/.vim

```
$ cd ~
[$ mv .vim vimold] # if you have one
$ git clone https://github.com/fbicknel/vim_bells_and_whistles.git .vim

(Or get a URL from github)
```

Then expand all the submodules by using:

```
$ .vim/install
```

This will expand all the submodules and link your .vimrc to .vim/vimrc.  If
you have a .vimrc, it will be saved as vimrc_save.
