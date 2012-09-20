;;; pelm-package.el --- PELM talking with elpa
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:

;; elpa package manager

(setq package-archives
      '(("gnu"         . "http://elpa.gnu.org/packages/")
        ("marmalade"   . "http://marmalade-repo.org/packages/")))
(package-initialize)

   ;'smex

(defvar pelm-packages
  (list 
   'magit
   'highlight-parentheses
   'auto-pair-plus
   'goto-last-change
   'auto-complete 
   'color-theme
   'psvn
   'magithub
   'fuzzy
   'lua-mode
   'popup
   'coffee-mode
   'markdown-mode
   'yaml-mode
   'yasnippet
   'emacs-w3m
   'clojure-mode
   'slime
   'offlineimap
   'sunrise-commander
   'browse-kill-ring)

  "Libraries that should be installed by default.")

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package pelm-packages)
  (unless (package-installed-p package)
    (package-install package)))



(provide 'pelm-package)
;;; pelm-package.el ends here


