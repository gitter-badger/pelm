;;; package --- init.el
;;; Commentary:
;; init.el of Pelm
;; Author: eggcaker
;; Last modified: 2015-01-16
;; Version: 2.5.0
;; Built on top of cask and pallet
;;
;;; Code:

;; init cask file
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(when (not (cl-remove-if-not
            (lambda (p) (equal 'org (car p)))
            package-alist))
  (message "No org-mode package found; installing now...")
  (package-install 'org))

(require 'org)
(when (string-match "^[1234567]" (org-version))
  (warn "The PELM expect org 8 or higher, but instead we have %s" (org-version)))

(require 'pallet)

(org-babel-load-file "~/.emacs.d/pelm.org")

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-list-file-prefix "~/.emacs.d/.cache/auto-save-list/.saves-")
 '(column-number-mode t)
  '(custom-safe-themes
     (quote
       ("54e9b56e67f57d28ba348ab27159938e0e911ce1359d3e25b2f618a211c8c4a1" "c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(explicit-shell-file-name "/usr/local/bin/zsh")
 '(global-writeroom-mode 1 nil (writeroom-mode))
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
 '(scroll-bar-width nil t)
 '(tool-bar-mode nil nil (tool-bar))
 '(wakatime-api-key "421c22a8-9ea8-4ae1-9d32-fbbcf8d34b40")
 '(wakatime-cli-path "/usr/local/bin/wakatime")
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
