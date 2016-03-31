vim_bells_and_whistles
======================

My .vim directory with a bunch of submodules and a vimrc that works with them

Clone this to ~/.vim

```
$ cd ~
[$ mv .vim vimold] # if you have one
$ git clone https://github.com/fbicknel/vim_bells_and_whistles.git .vim --recursive

(Or get a URL from github)
```
Note that --recursive will expand the submodules while you clone the repo. You don't have to do this all at once, running install next will also expand all the submodules.

Either way, you need to run:

```
$ .vim/install
```

This will make sure you expanded all the submodules and will link your .vimrc to .vim/vimrc.  If
you have a .vimrc, it will be saved as vimrc_save.
