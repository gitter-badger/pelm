;;; pelm-ac.el --- PELM emacs lisp
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:


(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode )
;(add-hook 'clojure-mode-hook 'autopair-mode)

(add-hook 'slime-repl-mode-hook
          (defun clojure-mode-slime-font-lock ()
            (require 'clojure-mode)
            (let (font-lock-mode)
              (clojure-mode-font-lock-setup))))


(setq swank-clojure-classpath (directory-files (concat pelm-vendor-dir "jars") t ".jar$"))

(provide 'pelm-lisp)
;;; pelm-lisp.el ends here 







