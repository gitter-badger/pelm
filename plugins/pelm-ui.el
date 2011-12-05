;;; pelm-ui.el  UI optimizations and tweaks 
;;
;; Copyright (c) 2011 eggcaker 
;; 
;; Author: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm
;; Version: 0.5.0
;;

;; This file is not part of GNU Emacs 

;;; Code

;; disabled menu-bar-mode
(unless (eq system-type 'darwin)
  (menu-bar-mode -1))

;; disable blink cursor 
(blink-cursor-mode -1)

;; hidden scroll bar
(when window-system
  (set-scroll-bar-mode nil))

;; color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-high-contrast)
;(color-theme-github)


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
  (add-to-list 'default-frame-alist '(alpha 90 50))
  (set-frame-parameter (selected-frame) 'alpha '(80 50)))

(defun pelm-disable-transparent()
  "Disable transparent mode"
  (interactive)
  (add-to-list 'default-frame-alist '(alpha 95 50))
  (set-frame-parameter (selected-frame) 'alpha '(95 50)))

;;enable transparent mode
(global-set-key (kbd "\C-c t e") 'pelm-enable-transparent)

;;disable transparent mode
(global-set-key (kbd "\C-c t d") 'pelm-disable-transparent)


;; switch buffer
(require 'iswitchb)
(iswitchb-mode t)
;; iswitchb ignores
(add-to-list 'iswitchb-buffer-ignore "^ ")
(add-to-list 'iswitchb-buffer-ignore "*Messages*")
(add-to-list 'iswitchb-buffer-ignore "*ECB")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "*ftp ")
(add-to-list 'iswitchb-buffer-ignore "*bsh")
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")

;; auto rebuffer 
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
(global-linum-mode 1)

(provide 'pelm-ui)
;; pelm-ui.el ends here

