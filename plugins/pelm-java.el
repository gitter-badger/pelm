;;; pelm-java.el --- PELM java-mode
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:



(autoload 'gtags-mode "gtags" "" t)


(add-to-list 'auto-mode-alist '("\\.java$" . java-mode))


(provide 'pelm-java)

;;; pelm-java.el ends here
