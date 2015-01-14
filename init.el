;; PELM - init.el
;; Author: caker
;; Last modified: 2013-10-10
;; Version: 2.5.0
;; Built on top of cask and pallet
;;


;; pelm start time
(defvar *pelm-load-start* (current-time))

;; Turn off early to avoid momentary display
(mapc
  (lambda (mode)
    (if (fboundp mode)
      (funcall mode -1)))
   '(menu-bar-mode tool-bar-mode scroll-bar-mode))

;; PELM root directory
(defvar pelm-dir (file-name-directory load-file-name)
  "The root dir of the PELM distribution.")

;; define hooks to run function before and after load the pelm
(defvar pelm-pre-init-hook nil)
(defvar pelm-post-init-hook nil)

(defconst pelm-plugins-dir (concat pelm-dir "plugins/")
  "This directory houses all of the built-in plem plugin.
   you should avoid modifying the configuration there.")

(defconst pelm-vendor-dir (concat pelm-dir "vendor/")
  "This directory house third part packages of emacs")

(defconst pelm-cache-dir (concat pelm-dir "cache/")
  "This directory for cache files.")

(add-to-list 'load-path pelm-plugins-dir)
(add-to-list 'load-path pelm-vendor-dir)
;(add-to-list 'load-path user-emacs-directory)

;; init cask file
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(require 's)
(require 'dash)
(require 'f)
(require 'git)
(require 'evm)
(require 'ert)
(require 'misc)

;; pre-init-local hook
(load (concat pelm-dir "pre-init-local") 'noerror)
(run-hooks 'pelm-pre-init-hook)

;; define pelm plugins
(defvar pelm-plugins
  '(
     runtime
     editor
     ui
     org
     yas
     evil
     keys
     git
          markups
     ;;scala
     ;; haskell
     ;;clojure
     lisp
     c
     go
     js
     java
     ;; php
     ;;objc
     blog
     ;;mail
     ;;android
     ;;gnus
     shell
     misc
     server
     ;;scrum
     ))

;; load plugins
(mapc (lambda (x)
        (require (intern (format "pelm-%s" x)) nil t))
	pelm-plugins)

(cond
  ((string-match "apple-darwin" system-configuration)
    (require 'pelm-mac))

  ((string-match "linux" system-configuration)
    (require 'pelm-linux))

  ((string-match "nt" system-configuration)
    (require 'pelm-windows)))

;; pelm-post-hook
(load (concat pelm-dir "post-init-local") 'noerror)
(run-hooks 'pelm-post-init-hook)

;; PELM loaded, show the load time
(message  "PELM loaded in %ds" (destructuring-bind (hi lo ms nn ) (current-time)
                                (- (+ hi lo) (+ (first *pelm-load-start*)
                                                (second *pelm-load-start*)))))
;;; ends init.el here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(explicit-shell-file-name "/usr/bin/zsh")
 '(inhibit-startup-screen t)
 '(jabber-auto-reconnect nil)
 '(jabber-avatar-verbose nil)
 '(jabber-chat-buffer-format "*-jabber-%n-*")
 '(jabber-history-enabled t)
 '(jabber-mode-line-mode t)
 '(jabber-roster-buffer "*-jabber-*")
 '(jabber-roster-line-format " %c %-25n %u %-8s (%r)")
 '(jabber-show-offline-contacts nil)
 '(jabber-vcard-avatars-retrieve nil)
 '(joc-eshell-prompt-newline t)
 '(js3-auto-indent-p t)
 '(js3-curly-indent-offset 2)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 2)
 '(js3-indent-on-enter-key t)
 '(js3-lazy-commas t)
 '(js3-lazy-dots t)
 '(js3-lazy-operators t)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(magit-use-overlays nil)
 '(scroll-bar-width nil t)
 '(tool-bar-mode nil nil (tool-bar))
 '(global-writeroom-mode 1)
 '(writeroom-border-width 20)
 '(writeroom-width 110))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "cyan"))))
 '(hl-line ((t (:inherit highlight :background "darkseagreen2"))))
 '(org-mode-line-clock ((t (:background "DarkGreen" :box (:line-width -1 :style released-button)))) t))
