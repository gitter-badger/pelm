;;; package --- pelm-evil.el PELM vim is the evil, but I like it !
;;; Commentary:
;;  The evil configurations
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://iemaccs.org/pelm

;; This file is not part of GNU Emacs

;;; Code:

(require 'evil-numbers)
(require 'goto-chg)
(require 'evil)
(require 'evil-nerd-commenter)
(require 'evil-indent-textobject)
(require 'evil-visualstar)
(require 'evil-jumper)

(global-evil-leader-mode t)
(global-evil-surround-mode t)
(evil-exchange-install)
(global-evil-matchit-mode t)
(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(setq evilnc-hotkey-comment-operator "gc")

(setq evil-jumper-auto-center t)
(setq evil-jumper-file (concat pelm-cache-dir "evil-jumps"))
(setq evil-jumper-auto-save-interval 3600)


(global-evil-leader-mode)

(eval-after-load "evil"  (evil-mode 1))
(evil-define-command pelm/evil-maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
                 nil 0.5)))
      (cond
        ((null evt) (message ""))
        ((and (integerp evt) (char-equal evt ?k))
          (delete-char -1)
          (set-buffer-modified-p modified)
          (push 'escape unread-command-events))

        (t (setq unread-command-events (append unread-command-events
                                         (list evt))))))))

;; initial set emacs state mode for some specie modes
(loop for (mode . state) in '(
                               (inferior-emacs-lisp-mode . emacs)
                               (shell-mode . emacs)
                               (eshell-mode . emacs)
                               (org-mode . emacs)
                               (haskell-interactive-mode . emacs)
                               (inferior-haskell-mode . emacs)
                               (mu4e-main-mode . emacs)
                               (mu4e-view-mode . emacs)
                               (mu4e-headers-mode . emacs)
                               (magit-branch-manager-mode-map . emacs)
                               (jabber-chat-mode . emacs)
                               (epresent-mode . emacs)
                               (jabber-roster-mode . emacs)
                               (2048-mode . emacs)
                               (magit-mode . emacs))
  do (evil-set-initial-state mode state))

(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (recenter))

(defadvice evil-ex-search-previous (after advice-for-evil-ex-search-previous activate)
  (recenter))

(provide 'pelm-evil)
;;; pelm-evil.el ends here
