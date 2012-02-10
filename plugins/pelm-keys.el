;;; pelm-keys.el --- PELM global shortkeys 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;; keyboard remark
(global-set-key "\M-h" 'delete-backward-char)
(global-set-key "\C-cG" 'end-of-buffer)
(global-set-key "\C-cg" 'beginning-of-buffer)
(global-set-key "\C-c{" 'beginning-of-defun)
(global-set-key "\C-c}" 'end-of-defun)


;;(windmove-default-keybindings)
(global-set-key (kbd "\e <left>") 'windmove-left)
(global-set-key (kbd "\e <down>") 'windmove-down)
(global-set-key (kbd "\e <up>") 'windmove-up)
(global-set-key (kbd "\e <right>") 'windmove-right)
(global-set-key (kbd "\C-co") 'org-mode)

;; no M-x 
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(define-key org-mode-map "\C-xa" 'org-insert-subheading)
(provide 'pelm-keys)

;;; pelm-keys.el ends here
