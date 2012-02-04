;;; pelm-scss.el --- PELM scss-mode
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(setq exec-path (cons (expand-file-name "~/.rvm/gems/ruby-1.9.2-p290/bin") exec-path))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)
(provide 'pelm-scss)

;;; pelm-scss.el ends here
