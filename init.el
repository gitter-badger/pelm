;; PELM - init.el
;; Author: caker
;; Last modified: 2012-06-22
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
(add-to-list 'load-path pelm-el-get-dir)


;; the PELM have pre-init.el and post-init.el which you can do your own code
;; pre-init.el load at begin, for example: if you using emacs < 24,you
;; can require org-mode here by :
;; (require 'org)  or you can load it from pre-init-private.org, see below
(load-file "~/.emacs.d/pre-init.el")

;; load the pre-init-local files if they exists
;; both of files are under .gitignore,
;; so it' wont' be version-controlled. The idea is to make
;; this file load other version-controlled or private stuff
;; before the pelm load.
(if (file-exists-p "~/.emacs.d/pre-init-local.org")
    (org-babel-load-file "~/.emacs.d/pre-init-local.org"))

(if (file-exists-p "~/.emacs.d/pre-init-local.el")
    (load-file "~/.emacs.d/pre-init-local.el"))


;; load plugins 
(require 'pelm-package)
(require 'pelm-runtime)
(require 'pelm-editor)
(require 'pelm-keys)
(require 'pelm-ui)
(require 'pelm-shell)
(require 'pelm-server)
(require 'pelm-ac)
(require 'pelm-git)
(require 'pelm-yas)
(require 'pelm-org)


;; load mode
(require 'pelm-c)
(require 'pelm-markups)
(require 'pelm-scala)
(require 'pelm-java)
(require 'pelm-php)
(require 'pelm-js)
(require 'pelm-lisp)
;;misc
(require 'pelm-misc)
(require 'pelm-blog)

;(require 'pelm-fun)

;; lab
(require 'pelm-android)

;;; os files
(require 'pelm-mac)
(require 'pelm-linux)

;;; personal configs ignored by git

;; orgmode file 
(if (file-exists-p "~/.emacs.d/post-init-local.org")
    (org-babel-load-file "~/.emacs.d/post-init-local.org"))

;; el file
(if (file-exists-p "~/.emacs.d/post-init-local.el")
    (load-file "~/.emacs.d/post-init-local.el"))


(package-manager-show-load-time)

;;; ends init.el here
