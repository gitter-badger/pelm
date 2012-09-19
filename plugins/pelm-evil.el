;;; pelm-ac.el --- PELM vim is the evil, but I like it !
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:

(setq el-get-evil
      '((:name evil
               :after (progn
                        ))
        (:name evil-leader)
        (:name evil-surround)
        ))
      

(el-get 'sync (loop for src in el-get-evil collect (el-get-source-name src)))

(evil-mode 1)
(require 'surround)
(global-surround-mode 1)
 
(evil-define-command pelm-evil-maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
        (delete-char -1)
        (set-buffer-modified-p modified)
        (push 'escape unread-command-events))
       
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

(define-key evil-insert-state-map "k" #'pelm-evil-maybe-exit)

;pelm-keymap conflict with evil-mode key
(define-key evil-normal-state-map (kbd "C-.") nil)


(define-key evil-normal-state-map ",w" 'save-buffer) ; save
(define-key evil-normal-state-map ",q" 'kill-buffer) ; quit (current buffer; have to press RETURN)

(define-key evil-normal-state-map ",x" 'save-buffers-kill-emacs) ; save and quit
(define-key evil-normal-state-map ";e" 'eval-last-sexp)
;; simulate vim's "nnoremap <space> 10jzz"
(define-key evil-normal-state-map " " (lambda ()
                                        (interactive)
                                        (next-line 10)
                                        (evil-scroll-line-down 10)
                                        ))

;; simulate vim's "nnoremap <backspace> 10kzz"

(define-key evil-normal-state-map [backspace] (lambda ()
                                                (interactive)
                                                (previous-line 10)
                                                (evil-scroll-line-up 10)
                                                ))
;; make evil work for org-mode!
(define-key evil-normal-state-map "O" (lambda ()
                                        (interactive)
                                        (end-of-line)
                                        (org-insert-heading)
                                        (evil-append nil)
                                        ))
(defun always-insert-item ()
  (interactive)
  (if (not (org-in-item-p))
      (insert "\n- ")
    (org-insert-item)))

(define-key evil-normal-state-map "O" (lambda ()
                                        (interactive)
                                        (end-of-line)
                                        (org-insert-heading)
                                        (evil-append nil)
                                        ))
(define-key evil-normal-state-map "o" (lambda ()
                                        (interactive)
                                        (end-of-line)
                                        (always-insert-item)
                                        (evil-append nil)
                                        ))

(define-key evil-normal-state-map "t" (lambda ()
                                        (interactive)
                                        (end-of-line)
                                        (org-insert-todo-heading nil)
                                        (evil-append nil)
                                        ))

(define-key evil-normal-state-map (kbd "M-o") (lambda ()
                                                (interactive)
                                                (end-of-line)
                                                (org-insert-heading)
                                                (org-metaright)
                                                (evil-append nil)
                                                ))

(define-key evil-normal-state-map (kbd "M-t") (lambda ()
                                                (interactive)
                                                (end-of-line)
                                                (org-insert-todo-heading nil)
                                                (org-metaright)
                                                (evil-append nil)
                                                ))

(define-key evil-normal-state-map "T" 'org-todo) ; mark a TODO item as DONE
(define-key evil-normal-state-map ";a" 'org-agenda) ; access agenda buffer
(define-key evil-normal-state-map "-" 'org-cycle-list-bullet) ; change bullet style

;; allow us to access org-mode keys directly from Evil's Normal mode
(define-key evil-normal-state-map "L" 'org-shiftright)
(define-key evil-normal-state-map "H" 'org-shiftleft)
(define-key evil-normal-state-map "K" 'org-shiftup)
(define-key evil-normal-state-map "J" 'org-shiftdown)
(define-key evil-normal-state-map (kbd "M-l") 'org-metaright)
(define-key evil-normal-state-map (kbd "M-h") 'org-metaleft)
(define-key evil-normal-state-map (kbd "M-k") 'org-metaup)
(define-key evil-normal-state-map (kbd "M-j") 'org-metadown)
(define-key evil-normal-state-map (kbd "M-L") 'org-shiftmetaright)
(define-key evil-normal-state-map (kbd "M-H") 'org-shiftmetaleft)
(define-key evil-normal-state-map (kbd "M-K") 'org-shiftmetaup)
(define-key evil-normal-state-map (kbd "M-J") 'org-shiftmetadown)
(define-key evil-normal-state-map (kbd "<f12>") 'org-export-as-html)

;;; initial set emacs state mode for some specie modes 
(loop for (mode . state) in '((inferior-emacs-lisp-mode . emacs) 
(shell-mode . emacs) 
(magit-branch-manager-mode-map . emacs) 
(magit-mode . emacs) 
(org-mode . emacs)) 
do (evil-set-initial-state mode state)) 

(provide 'pelm-evil)
;;; pelm-evil.el ends here.
