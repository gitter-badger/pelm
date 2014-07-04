;;; pelm-scala.el --- PELM scala 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(unless (require 'scala-mode nil t)
  (el-get 'sync "scala-mode"))


(require 'scala-mode-auto)

(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))

(add-hook 'scala-mode-hook
          '(lambda()
             (yas-minor-mode-on)
             (auto-complete-mode)
             ))

(add-hook 'scala-mode-hook
          '(lambda ()
             (yas-minor-mode-on)
             ))

(add-hook 'inferior-scala-mode
          '(lambda()
             (auto-complete-mode)
             ))


(provide 'pelm-scala)
;;; pelm-scala.el ends here
