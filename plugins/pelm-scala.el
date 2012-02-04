;;; pelm-scala.el --- PELM scala 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(require 'scala-mode-auto)
(add-hook 'scala-mode-hook
          '(lambda()
             (yas/minor-mode-on)
             (auto-complete-mode)
             ))


(add-hook 'inferior-scala-mode
          '(lambda()
             (auto-complete-mode)
             ))

(provide 'pelm-scala)


;;; pelm-scala.el ends here
