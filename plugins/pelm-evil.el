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
        (:name evil-numbers)
        (:name evil-leader)
        (:name evil-surround)
        ))
      

(el-get 'sync (loop for src in el-get-evil collect (el-get-source-name src)))

(evil-mode 1)
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


(define-minor-mode pelm-evil-org-mdoe
  :init-value nil
  :lighter "PEO"
  :keymap (make-sparse-keymap)
  :group 'pelm
  )

(add-hook 'org-mode-hook 'pelm-evil-org-mode)


(evil-define-key 'normal pelm-evil-org-mode-map
  "gh" 'outline-up-heading
  "gj" 'org-forward-same-level
  "gk" 'org-backward-same-level
  "gl" 'outline-next-visible-heading
  "H" 'org-shiftleft
  "J" 'org-shiftdown
  "K" 'org-shiftup
  "L" 'org-shiftright
  "t" 'org-todo
  "$" 'org-end-of-line
  "^" 'org-beginning-of-line
  "-" 'org-ctrl-c-minus
  "<" 'org-metaleft
  ">" 'org-metaright
  ";a" 'org-agenda ; access agenda buffer
)

;; normal & insert state shortcuts.
(mapcar (lambda (state)
          (evil-define-key state pelm-evil-org-mode-map
            (kbd "M-l") 'org-metaright
            (kbd "M-h") 'org-metaleft
            (kbd "M-k") 'org-metaup
            (kbd "M-j") 'org-metadown
            (kbd "M-L") 'org-shiftmetaright
            (kbd "M-H") 'org-shiftmetaleft
            (kbd "M-K") 'org-shiftmetaup
            (kbd "M-J") 'org-shiftmetadown)) '(normal insert))


;;; initial set emacs state mode for some specie modes 
(loop for (mode . state) in '(
                              (inferior-emacs-lisp-mode . emacs) 
                              (shell-mode . emacs) 
                              (magit-branch-manager-mode-map . emacs) 
                              (magit-mode . emacs)) 
      do (evil-set-initial-state mode state))

(provide 'pelm-evil)
;;; pelm-evil.el ends here.

