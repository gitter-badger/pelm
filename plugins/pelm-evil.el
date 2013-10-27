;;; pelm-ac.el --- PELM vim is the evil, but I like it !
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:

(require 'evil-tabs)
(require 'evil-numbers)
(require 'goto-chg)
(require 'pelm-util)

(global-evil-leader-mode)
(evil-leader/set-leader ",")

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
                              (jabber-roster-mode . emacs)
                              (magit-mode . emacs)) 
      do (evil-set-initial-state mode state))


(fill-keymap evil-normal-state-map
             "Y"     (kbd "y$")
             "+"     'evil-numbers/inc-at-pt
             "-"     'evil-numbers/dec-at-pt
             "SPC"   'evil-ace-jump-char-mode
             "S-SPC" 'evil-ace-jump-word-mode
             "C-SPC" 'evil-ace-jump-line-mode
             "go"    'goto-char
             "C-t"   'transpose-chars
             "C-:"   'eval-expression
             ":"     'evil-repeat-find-char-reverse
             "gH"    'evil-window-top
             "gL"    'evil-window-bottom
             "gM"    'evil-window-middle
             "H"     'beginning-of-line
             "L"     'end-of-line
             )

(fill-keymap evil-motion-state-map
             "y"     'evil-yank
             "Y"     (kbd "y$")
             "_"     'evil-first-non-blank
             "C-e"   'end-of-line
             "C-S-d" 'evil-scroll-up
             "C-S-f" 'evil-scroll-page-up
             "_"     'evil-first-non-blank
             "C-y"   nil)

(fill-keymap evil-insert-state-map
;             "SPC" 'pelm/yas-expand-or-spc
             "j"   'pelm/evil-maybe-exit
             "C-h" 'backward-delete-char
             "C-k" 'kill-line
             "C-y" 'yank
             "C-e" 'end-of-line)

(fill-keymaps (list evil-operator-state-map
                    evil-visual-state-map)
             ;; works like `f'
             "SPC"   'evil-ace-jump-char-mode
             ;; works like `t'
             "C-SPC" 'evil-ace-jump-char-to-mode
             "S-SPC" 'evil-ace-jump-word-mode)



;; change mode-line color by evil state
   (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#328fde" . "#f1f1f1"))
                            ((evil-emacs-state-p)  '("#444488" . "#f1f1f1"))
                            ((buffer-modified-p)   '("#006fa0" . "#f1f1f1"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))

(provide 'pelm-evil)
;;; pelm-evil.el ends here.

