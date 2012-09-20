;;; auto-complete configuration, loaded by el-get

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


(message "auto-complete laoded")




