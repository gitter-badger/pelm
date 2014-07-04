;;; pelm-keys.el --- PELM global shortkeys 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs


(evil-leader/set-key
  ;; common keys
  "e" 'find-file ;'helm-mini
  "r" 'org-capture
  "f" 'projectile-find-file
  "b" 'ido-switch-buffer
  "k" 'kill-buffer-no-question
  "w" 'evil-window-map
  )

;(global-set-key (kbd  "C-x C-f") 'helm-find-files)
(global-set-key  "\M-n" 'scroll-up-command)
(global-set-key  "\M-p" 'scroll-down-command)

(fill-keymap evil-normal-state-map ";" 'evil-window-map)
(fill-keymap evil-normal-state-map ":" 'evil-ex)
(fill-keymap evil-normal-state-map "TAB"  'evil-indent)
(fill-keymap evil-visual-state-map "TAB"  'evil-indent)
(fill-keymap evil-normal-state-map "C-t" nil)
(fill-keymap evil-insert-state-map "C-t" nil)
(fill-keymap evil-insert-state-map "C-O" 'evil-open-above)


(define-key evil-window-map "v" 'split-window-vertically)
(define-key evil-window-map "s" 'split-window-horizontally)
(define-key evil-window-map "0" 'delete-window)
(define-key evil-window-map "1" 'delete-other-windows)
(define-key evil-window-map "2" 'split-window-below)
(define-key evil-window-map "3" 'split-window-right)
(define-key evil-window-map "4" 'ctl-x-4-prefix)
(define-key evil-window-map "5" 'ctl-x-5-prefix)



;; projectile 
(provide 'pelm-keys)
;;; pelm-keys.el ends here
