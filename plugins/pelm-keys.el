;;; pelm-keys.el --- PELM global shortkeys 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs


(global-set-key [(control .)] 'pelm-keymap)
(define-prefix-command 'pelm-keymap)

;; keyboard remark

(define-key pelm-keymap "G" 'end-of-buffer)
(define-key pelm-keymap "g" 'beginning-of-buffer)
(define-key pelm-keymap "{" 'beginning-of-defun)
(define-key pelm-keymap "}" 'end-of-defun)


;;(windmove-default-keybindings)
(global-set-key (kbd "\e <left>") 'windmove-left)
(global-set-key (kbd "\e <down>") 'windmove-down)
(global-set-key (kbd "\e <up>") 'windmove-up)
(global-set-key (kbd "\e <right>") 'windmove-right)


(define-key pelm-keymap "el" 'downcase-region)
(define-key pelm-keymap "eu" 'upcase-region)

(defun split_window_3 ()
  "split window horizontally and go to it"
  (interactive)
  (split-window-horizontally)
  (windmove-right))

;;evil setup 

;pelm-keymap conflict with evil-mode key
(define-key evil-normal-state-map (kbd "C-.") nil)
;(define-key pelm-keymap "uf" 'ns-toggle-fullscreen)
(define-key pelm-keymap "ev" 'turn-on-evil-mode)

(global-set-key  "\M-n" 'scroll-up-command)
(global-set-key  "\M-p" 'scroll-down-command)

(provide 'pelm-keys)

;;; pelm-keys.el ends here




