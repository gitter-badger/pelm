;;; pelm-ac.el --- PELM ac-mode 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:

(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat pelm-vendor-dir "ac/ac-dict"))
(global-auto-complete-mode t)

(add-to-list 'ac-modes 'jde-mode)
(add-to-list 'ac-modes 'java-mode)
(add-to-list 'ac-modes 'nxml-mode)
(add-to-list 'ac-modes 'objc-mode)
;; Use C-n/C-p to select candidates
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous); auto completion 


; should be add to the pelm  local file,
; it's too slow on my poor mac book !
;(require 'ajc-java-complete-config)
;(add-hook 'java-mode-hook 'ajc-java-complete-mode)


(provide 'pelm-ac)
;;pelm-ac.el ends here
