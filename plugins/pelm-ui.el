;;; pelm-ui.el  UI optimizations and tweaks 
;;
;; Copyright (c) 2011 eggcaker 
;; 
;; Author: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs 

;;; Code

;; disabled menu-bar-mode
(menu-bar-mode -1)

;; disable blink cursor 
(blink-cursor-mode -1)

;; hidden scroll bar
(set-scroll-bar-mode nil)

;; color-theme

;(load-theme 'leuven t)

(color-theme-initialize)
;(color-theme-solarized-dark)
(color-theme-solarized-light)
;(load-file "~/.emacs.d/themes/pelm-light-theme.el")
(require 'powerline)
;(require 'moe-theme)
;(moe-light)
;(powerline-moe-theme)

;;disable splash screen and tools bar
(custom-set-variables
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(joc-eshell-prompt-newline t)
 '(scroll-bar-width nil t)
 '(tool-bar-mode nil nil (tool-bar)))

;; yes -> y no -> n
(fset 'yes-or-no-p 'y-or-n-p)

;; transparent window
(defun pelm-enable-transparent()
  "Enable transparent mode"
  (interactive)
  (add-to-list 'default-frame-alist '(alpha 85 50))
  (set-frame-parameter (selected-frame) 'alpha '(85 50)))

(defun pelm-disable-transparent()
  "Disable transparent mode"
  (interactive)
  (add-to-list 'default-frame-alist '(alpha 100 100))
  (set-frame-parameter (selected-frame) 'alpha '(100 100)))

;;enable transparent mode
(define-key pelm-keymap "ute" 'pelm-enable-transparent)
;;disable transparent mode
(define-key pelm-keymap "utd" 'pelm-disable-transparent)

;auto rebuffer 
(global-auto-revert-mode t) 

;; kill buffer without confirm
(defun kill-buffer-no-question ()
  (interactive)
  (kill-buffer (buffer-name)))
(global-set-key "\C-xk" 'kill-buffer-no-question)

;; highlight the bracket
(show-paren-mode t)

;; disable jumping between bracket
(setq show-paren-style 'parentheses)

;; disable bell
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; disable scratch message
(setq initial-scratch-message nil)

;; highlight column80
(require 'column-marker) 
(dolist (hook '(emacs-lisp-mode-hook 
                cperl-mode-hook 
                shell-mode-hook 
                text-mode-hook 
                java-mode-hook
                change-log-mode-hook 
                makefile-mode-hook 
                message-mode-hook 
                texinfo-mode-hook)) 

(add-hook hook (lambda () 
  (interactive) 
  (column-marker-1 98) 
  (column-marker-2 99)                   
  (column-marker-3 100))))

;; show line-number on the left panel
(global-linum-mode 0)
(define-key pelm-keymap "ul" 'global-linum-mode)

(setq main-line-separator-style 'contour)

(provide 'pelm-ui)
;; pelm-ui.el ends here
