;;; pelm-keys.el --- PELM global shortkeys 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs



;;(windmove-default-keybindings)
(global-set-key (kbd "\e <left>") 'windmove-left)
(global-set-key (kbd "\e <down>") 'windmove-down)
(global-set-key (kbd "\e <up>") 'windmove-up)
(global-set-key (kbd "\e <right>") 'windmove-right)

(define-key pelm-keymap "h" 'windmove-left)
(define-key pelm-keymap "l" 'windmove-right)
(define-key pelm-keymap "k" 'windmove-up)
(define-key pelm-keymap "j" 'windmove-down)

(define-key pelm-keymap "el" 'downcase-region)
(define-key pelm-keymap "eu" 'upcase-region)

(define-key pelm-keymap "g" 'evil-goto-first-line) 
(define-key pelm-keymap "G" 'evil-goto-line) 

;sunrise 
(define-key pelm-keymap "d" 'sunrise)

(global-set-key  "\M-n" 'scroll-up-command)
(global-set-key  "\M-p" 'scroll-down-command)

;;TODO
(defun pelm-open-plugin-file ()
  "Open the plugin file by short name"
  (interactive )
  (find-file (concat pelm-dir  "plugins/"))
  )

(define-key pelm-keymap "f" 'pelm-open-plugin-file)
(provide 'pelm-keys)

;;; pelm-keys.el ends here





