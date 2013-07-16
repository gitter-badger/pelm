;;; pelm-ac.el --- PELM vim is the evil, but I like it !
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:


(setq el-get-evil-packages
      '((:name evil)
        (:name evil-numbers)
        (:name evil-leader)
        (:name evil-surround)
        ))


(el-get 'sync (loop for src in el-get-evil-packages collect (el-get-source-name src)))

(eval-after-load "evil"
(evil-mode 1)
)
(global-surround-mode 1)

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


(defun pelm-mpc-next-song ()
  "mpc next "
  (interactive)
  (shell-command "mpc next"))


(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map ",ga" 'org-agenda)
     (define-key evil-normal-state-map ",b" 'ido-switch-buffer)
     (define-key evil-normal-state-map ",t" 'pelm-goto-entry)
     (define-key evil-normal-state-map ";e" 'eval-last-sexp)
     (define-key evil-normal-state-map ",q" 'kill-buffer)
     (define-key evil-normal-state-map ",n" 'pelm-mpc-next-song)
     (define-key evil-normal-state-map ",w" 'save-buffer)
     (define-key evil-normal-state-map (kbd "C-.") nil)
     (define-key evil-normal-state-map ",x" 'save-buffers-kill-emacs)
     ))
;(define-key evil-normal-state-map [tab] nil) 

(defun pelm-goto-entry ()
  (interactive)
  (org-refile t)
  )

(evil-define-key 'normal org-mode-map "gh" 'outline-up-heading)
(evil-define-key 'normal org-mode-map "gt" 'pelm-goto-entry)
     
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

;; normal & insert state shortcuts.
(mapc (lambda (state)
             (evil-define-key state org-mode-map
               (kbd "M-l") 'org-metaright
               (kbd "M-h") 'org-metaleft
               (kbd "M-k") 'org-metaup
               (kbd "M-j") 'org-metadown
               (kbd "M-L") 'org-shiftmetaright
               (kbd "M-H") 'org-shiftmetaleft
               (kbd "M-K") 'org-shiftmetaup
               (kbd "M-J") 'org-shiftmetadown)) '(normal insert))

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

