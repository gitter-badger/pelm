;;; pelm-ac.el --- PELM vim is the evil, but I like it !
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:

(require 'evil-tabs)

(global-evil-leader-mode)
(evil-leader/set-leader ",")

(eval-after-load "evil"  (evil-mode 1))

(evil-leader/set-key
  "e" 'find-file
  "f" 'projectile-find-file
  "b" 'ido-switch-buffer
  "w" 'save-buffer
  "k" 'kill-buffer-no-question)

(evil-define-command pelm-evil-maybe-exit ()
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
(define-key evil-insert-state-map "j" #'pelm-evil-maybe-exit)

(mapc (lambda (state)
        (evil-define-key state org-mode-map
       "gh" 'outline-up-heading
       "gl" 'outline-next-visible-heading
       "gt" 'pelm-goto-entry 
       "mm" 'org-ctrl-c-ctrl-c
       "H" 'org-shiftleft
       "J" 'org-shiftdown
       "K" 'org-shiftup
       "L" 'org-shiftright
       "t" 'org-todo
       "$" 'org-end-of-line
       "0" 'org-beginning-of-line
       "-" 'org-ctrl-c-minus
       "<" 'org-metaleft
       ">" 'org-metaright)) '(normal))

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
                              (jabber-roster-mode . emacs)
                              (magit-mode . emacs)) 
      do (evil-set-initial-state mode state))

(provide 'pelm-evil)
;;; pelm-evil.el ends here.

