;;
;; file: init.el 
;; author: caker
;; last modified: 2011-11-30
;;

(add-to-list 'load-path "~/.emacs.d")

;; the PELM have 2 local files for you to do your own code 
;; local.el load at begin, for example: if you using emacs < 24
;; you can require org-mode here by :
;; (require 'org)

(if (file-exists-p "~/.emacs.d/local.el")
    (load-file "~/.emacs.d/local.el")
)


;; runtime can't override 
(org-babel-load-file "~/.emacs.d/plugins/runtime/pelm-runtime.org")





;; You're expected to populate .emacs.d/local.org
;; with your own code. This file is under .gitignore
;; so it won't be version-controlled. The idea is to
;; make this file load other version-controlled files.

(if (file-exists-p "~/.emacs.d/local.org")
    (org-babel-load-file "~/.emacs.d/local.org"))

(package-manager-show-load-time)

;;; ends init.el here
