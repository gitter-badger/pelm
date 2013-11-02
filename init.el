;; PELM - init.el
;; Author: caker
;; Last modified: 2013-10-10
;; Version: 2.5.0
;; Built on top of cask and pallet
;;


;; pelm start time 
(defvar *pelm-load-start* (current-time))

;; Turn off early to avoid momentary display
(mapc 
  (lambda (mode)
    (if (fboundp mode)
      (funcall mode -1)))
   '(menu-bar-mode tool-bar-mode scroll-bar-mode))

;; PELM root directory
(defvar pelm-dir (file-name-directory load-file-name)
  "The root dir of the PELM distribution.")

;; define hooks to run function before and after load the pelm 
(defvar pelm-pre-init-hook nil)
(defvar pelm-post-init-hook nil)

(defvar pelm-plugins-dir (concat pelm-dir "plugins/")
  "This directory houses all of the built-in plem plugin.
   you should avoid modifying the configuration there.")

(defvar pelm-vendor-dir (concat pelm-dir "vendor/")
  "This directory house third part packages of emacs")

(add-to-list 'load-path pelm-plugins-dir)
(add-to-list 'load-path pelm-vendor-dir)
(add-to-list 'load-path user-emacs-directory)

;; init cask file 
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(require 's)
(require 'dash)
(require 'f)
(require 'git)
(require 'evm)
(require 'ert)
(require 'misc)

;; pre-init-local hook
(load (concat pelm-dir "pre-init-local") 'noerror)
(run-hooks 'pelm-pre-init-hook)

;; define pelm plugins
(setq pelm-plugins 
      '(
        runtime
        editor
        ui
        org
        yas
        evil
        keys
        git
        c
        markups
        ;scala
       ; haskell
        ;clojure
        lisp
        java
       ; php
        js
        ;objc
        blog
        ;mail
        android
        ;gnus
        shell
        misc
        server
))

;; load plugins 
(mapcar (lambda (x) 
	  (require (intern (format "pelm-%s" x)) nil t))
	pelm-plugins)

(cond
    ((string-match "apple-darwin" system-configuration)
     (require 'pelm-mac))
   
    ((string-match "linux" system-configuration)
     (require 'pelm-linux))

    ((string-match "nt" system-configuration)
     (require 'pelm-windows)))

;; pelm-post-hook 
(load (concat pelm-dir "post-init-local") 'noerror)
(run-hooks 'pelm-post-init-hook)

;; PELM loaded, show the load time 
(message  "PELM loaded in %ds" (destructuring-bind (hi lo ms nn ) (current-time)
                                (- (+ hi lo) (+ (first *pelm-load-start*)
                                                (second *pelm-load-start*)))))
;;; ends init.el here


