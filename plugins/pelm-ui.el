
;;; package pelm-ui.el  UI optimizations and tweaks
;;
;; Copyright (c) 2011 eggcaker
;;
;; Author: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;; disabled menu-bar-mode
(menu-bar-mode -1)

;; disable blink cursor
(blink-cursor-mode -1)
;; hidden scroll bar
(set-scroll-bar-mode nil)

;; color-theme
(color-theme-initialize)
;;(color-theme-solarized-dark)
;;(color-theme-solarized-light)
;;(load-file "~/.emacs.d/themes/pelm-light-theme.el")
;;(load-theme 'monokai t)
(load-theme 'molokai t)

(setq molokai-theme-kit t)


;(require 'powerline)
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
  (column-marker-1 100)
  (column-marker-2 110)
  (column-marker-3 120))))

;; show line-number on the left panel
(global-linum-mode 0)
(define-key pelm-keymap "ul" 'global-linum-mode)

(setq main-line-separator-style 'contour)

;; Alternatively, you can paint your mode-line in White but then
;; you'll have to manually paint it in black again
;; (custom-set-faces
;;  '(mode-line-highlight ((t nil)))
;;  '(mode-line ((t (:foreground "white" :background "white"))))
;;  '(mode-line-inactive ((t (:background "white" :foreground "white")))))


(defvar-local hidden-mode-line-mode nil)
(defvar-local hide-mode-line nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

(hidden-mode-line-mode)

(after "org"
  (mapc (lambda(fb) (set-fringe-bitmap-face fb 'org-hide))
        fringe-bitmaps))

(provide 'pelm-ui)
;;; pelm-ui.el ends here
