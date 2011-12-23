;;; pelm-scala.el --- PELM scala 
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


(require 'scala-mode-auto)
(add-hook 'scala-mode-hook
          '(lambda()
             (yas/minor-mode-on)
             ))

(provide 'pelm-scala)

;;; pelm-scala.el ends here
