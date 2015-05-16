# PELM

[![Join the chat at https://gitter.im/eggcaker/pelm](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/eggcaker/pelm?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## an "P" Emacs Lisp Manager

What's the P ? the P can be one of Personal or Public (if you like it) I hope every body like it, but maybe not.
any fork is welcome!

## Dependencies
* cask install with `brew install cask`
* libtool
* g++
* libglib2.0-dev
* libgmime-2.6-dev
* php5 ( for stock bin)
* libxapian-dev
* texinfo

## Install
clone source code from github to .emacs.d

```
$ cd ~  
$ git clone http://github.com/eggckaer/pelm.git .emacs.d  
$ cd .emacs.d  
$ git submodule init  
$ git submodule update  
```

or , clone source code to some where in your folder and ln it for example, you want clone to ~/pelm

```
$ git clone http://github.com/eggcaker/pelm.git ~/pelm  
$ ln -s ~/pelm ~/.emacs.d   
$ cd ~/pelm  
$ git submodule init  
$ git submodule update  
```

when you start emacs at first time after you cloned the PELM, 
you may get warning from install package, just ignore that, exit emacs and reopen Emacs.

## Byte compile (optional but recommented)

```
C-u 0 M-x byte-recompile-directory
```
## Customize
after you clone the PELM, check the init.el, you can add your own code in 2 files :

* pre-init-local.org

   the PELM loaded it before load plugins but after the pre-init.el

* post-init-local.org

  the PELM loaded after all plugins

both of them ignore by git, so can add some experimental code.

## License
  MIT



