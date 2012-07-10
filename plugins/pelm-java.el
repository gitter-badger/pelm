;;; pelm-java.el --- PELM java-mode
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(autoload 'gtags-mode "gtags" "" t)

(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

;; cedet 1.1
(load-file (concat pelm-vendor-dir "cedet/common/cedet.el"))
(global-ede-mode t)

(add-to-list 'load-path (concat pelm-vendor-dir "jdee/lisp"))

(require 'jde-autoload)


(provide 'pelm-java)

;;; pelm-java.el ends here


