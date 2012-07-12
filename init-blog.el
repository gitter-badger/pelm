;; PELM - init.el file for generate blog on batch mode
;; Author: caker
;; Last modified: 2012-07-12
;; Version: 1.0.0

(add-to-list 'load-path "~/.emacs.d")

(defvar pelm-dir (file-name-directory load-file-name)
  "The root dir of the PELM distribution.")


(defvar pelm-plugins-dir (concat pelm-dir "plugins/")
  "This directory houses all of the built-in plem plugin.
   you should avoid modifying the configuration there.")

(defvar pelm-vendor-dir (concat pelm-dir "vendor/")
  "This directory house third part packages of emacs")

(defvar pelm-el-get-dir (concat pelm-dir "el-get/")
  "This directory house the el-get packages")


(add-to-list 'load-path pelm-plugins-dir)
(add-to-list 'load-path pelm-vendor-dir)
(add-to-list 'load-path (concat pelm-el-get-dir "o-blog"))

;; the PELM have pre-init.el and post-init.el which you can do your own code
;; pre-init.el load at begin, for example: if you using emacs < 24,you
;; can require org-mode here by :
;; (require 'org)  or you can load it from pre-init-private.org, see below
(load-file "~/.emacs.d/pre-init.el")


;; load plugins 
;(require 'pelm-package)
;(require 'pelm-runtime)
(require 'org)
(require 'org-install)
(require 'o-blog)
;(require 'pelm-editor)
;(require 'pelm-keys)
;(require 'pelm-ui)
;(require 'pelm-shell)
;(require 'pelm-server)
;(require 'pelm-ac)
;(require 'pelm-git)
;(require 'pelm-yas)
;(require 'pelm-org)


;; load mode
;(require 'pelm-c)
;(require 'pelm-markups)
;(require 'pelm-scala)
;(require 'pelm-php)
;(require 'pelm-js)

;;misc
;(require 'pelm-misc)

;(require 'pelm-fun)

;; lab
;(require 'pelm-android)

;;; os files
;(require 'pelm-mac)
;(require 'pelm-linux)

;;; personal configs ignored by git

;; orgmode file 
;(if (file-exists-p "~/.emacs.d/post-init-local.org")
;    (org-babel-load-file "~/.emacs.d/post-init-local.org"))



;;; ends init.el here
