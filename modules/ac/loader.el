;; auto complemation
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/modules/ac/ac-dict")
(global-auto-complete-mode t) 

(add-to-list 'ac-modes 'jde-mode)
(add-to-list 'ac-modes 'java-mode)
(add-to-list 'ac-modes 'nxml-mode)
;; Use C-n/C-p to select candidates
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)



