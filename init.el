;; PELM's init.el
;; Author: caker
;; Last modified: 2012-02-04
;; Version: 0.8.0

(add-to-list 'load-path "~/.emacs.d")

(defvar pelm-dir (file-name-directory load-file-name)
  "The root dir of the PELM distribution.")

(defvar pelm-elpa-dir (concat pelm-dir "elpa/")
  "Elpa directory ")

(defvar pelm-plugins-dir (concat pelm-dir "plugins/")
  "This directory houses all of the built-in plem plugin.
   you should avoid modifying the configuration there.")

(defvar pelm-vendor-dir (concat pelm-dir "vendor/")
  "This directory house third part packages of emacs")

(defvar pelm-personal-dir (concat pelm-dir "personal/")
  "Users of PELM are encouraged to keep their personal configuration
   changes in this directory. All Emacs Lisp files there are loaded
   automatically by PELM.")

(add-to-list 'load-path pelm-elpa-dir)
(add-to-list 'load-path pelm-plugins-dir)
(add-to-list 'load-path pelm-vendor-dir)
(add-to-list 'load-path pelm-personal-dir)

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
(require 'pelm-runtime)
(require 'pelm-editor)
(require 'pelm-ui)
(require 'pelm-editor)
(require 'pelm-keys)
(require 'pelm-shell)
(require 'pelm-server)
(require 'pelm-ac)
(require 'pelm-git)
(require 'pelm-yas)
(require 'pelm-org)


;; load mode
(require 'pelm-c)
(require 'pelm-yml)
(require 'pelm-markdown)
(require 'pelm-scss)
(require 'pelm-scala)
(require 'pelm-php)

;; lab
(require 'pelm-android)

;; marmalade repository
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; load the personal settings 
(when (file-exists-p pelm-personal-dir)
  (mapc 'load (directory-files pelm-personal-dir nil "^[^#].*el$")))

;; sanbox for test 
(if (file-exists-p "~/.emacs.d/post-init-local.el")
    (load-file "~/.emacs.d/post-init-local.el"))


(package-manager-show-load-time)

;;; ends init.el here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(joc-eshell-prompt-newline t)
 '(org-mobile-directory "~/Dropbox/org")
 '(org-mobile-inbox-for-pull "~/.org-files/refile.org")
 '(scroll-bar-width nil t)
 '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-mode-line-clock ((t (:background "grey75" :foreground "red" :box (:line-width -1 :style released-button)))) t))
