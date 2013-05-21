;;; pelm-markups.el --- PELM markup mode
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;;; markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command "mmd"))

(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))

;;; jade 
(require 'stylus-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;;; yml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(provide 'pelm-markups)
;;; pelm-markups.el ends here
