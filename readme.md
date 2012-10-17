
# What is PELM?
	
	
  PELM  - a "literate" Emacs Lisp Manager  for Emacs (24.0 and greater).

  What's the P means? the P  can be one of Personal or Public (if you like it)
  I hope every body like it, but maybe not. any fork is welcome!

## Install
### Basic install 

- clone source code from github to .emacs.d
  
#+BEGIN_SRC sh
$ cd ~
$ git clone http://github.com/eggckaer/pelm.git .emacs.d
$ cd .emacs.d
$ git submodule init
$ git submodule update

#+END_SRC

- clone source code to some where in your folder and ln it 
  for example, you want clone to ~/pelm
  
#+BEGIN_SRC sh
$ git clone http://github.com/eggcaker/pelm.git ~/pelm 
$ ln -s ~/pelm ~/.emacs.d 
$ cd ~/pelm
$ git submodule init
$ git submodule update
#+END_SRC
*** Byte compile (optional but recommented)
#+BEGIN_SRC emacs-lisp
C-u 0 M-x byte-recompile-directory
#+END_src
** Customize 
   after you clone the PELM, check the init.el, you can add your own code 
   in 2 files :
- pre-init-local.org 
   the PELM loaded  it before load plugins but after the pre-init.el

- post-init-local.org 
  the PELM loaded after all plugins  

   both of them ignore by git, so can add some experimental code.
** License
MIT 
* Pages
** Links
   :PROPERTIES:
   :SNIPPET:  t
   :END:

[[https://github.com/eggcaker/pelm][/icon-eye-open icon-black/ View on Github]]

[[file:{lisp}(ob:path-to-root){/lisp}/plugins.html][/icon-list icon-black/ Plugins]]

[[file:{lisp}(ob:path-to-root){/lisp}/changelog.html][/icon-pencil icon-black/ Changelog]]

[[file:{lisp}(ob:path-to-root){/lisp}/todo.html][/icon-fire icon-black/ TODO]]
** Changelog
:PROPERTIES:
:PAGE: changelog.html
:TEMPLATE: blog_static_no_title.html
:END:

#+INCLUDE: "./History.org" orgmode
** Todo list [3/4]
:PROPERTIES:
:PAGE: todo.html
:TEMPLATE: blog_static_no_title.html
:END:

Task list : 
** Plugin List [0/22]
:PROPERTIES:
:PAGE: plugins.html
:TEMPLATE: blog_static_no_title.html
:END:

Thanks [[http://tapoueh.org/][Dimitri Fontaine]] built the [[https://github.com/dimitri/el-get][ el-get]]! I use it to install some third-part packages.
*** TODO pelm-ac
*** TODO pelm-android
*** TODO pelm-c
*** TODO pelm-editor
*** TODO pelm-fun
*** TODO pelm-git
*** TODO pelm-java
*** TODO pelm-js
*** TODO pelm-keys
*** TODO pelm-markups
*** TODO pelm-misc
*** TODO pelm-objc
*** TODO pelm-org
*** TODO pelm-package
*** TODO pelm-php
*** TODO pelm-ruby
*** TODO pelm-runtime
*** TODO pelm-scala
*** TODO pelm-server
*** TODO pelm-shell
*** TODO pelm-ui
*** TODO pelm-yas
*** TODO pelm-lisp


