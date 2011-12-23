;;; pelm-markdown.el --- PELM markdown mode
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm
;; Version: 0.5.0

;; This file is not part of GNU Emacs

;;; Comentary:


;;; License:

;; MIT license

;;; Code:


(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command "markdown | smartypants"))

(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))

(provide 'pelm-markdown)

;;; pelm-markdown.el ends here
