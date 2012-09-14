;;; pelm-editor.el --- PELM editor
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

;; no backups
(setq make-backup-files nil)


;;ido setups 
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".java" ".xml" ".org" ".el"))
(setq ido-ignore-extensions t)


(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
  Use ska-jump-to-register to jump back to the stored
  position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
  that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))

;; check pelm-editor.el for more information
(global-set-key "\C-x." 'ska-point-to-register)
(global-set-key "\C-x," 'ska-jump-to-register)

;;C-n add new line
(setq next-line-add-newlines t)


(require 'recentf)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(recentf-mode t)

(setq recentf-max-saved-item 15)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file:")
    (message "Aborting")))



(setq el-get-evil
      '((:name evil
               :after (progn
                        ))))

(el-get 'sync (loop for src in el-get-evil collect (el-get-source-name src)))


(evil-define-key 'normal pelm-minor-mode-map "gb" 'evil-mode)

(evil-define-command pelm/evil-maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?n)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?n))
        (delete-char -1)
        (set-buffer-modified-p modified)
        (push 'escape unread-command-events))
       
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

(define-key evil-insert-state-map "j" #'pelm/evil-maybe-exit)



(defun new_line_before ()
   "create a new line before curreent cursor and go to "
   (interactive)
   (previous-line)
   (end-of-line)
   (newline-and-indent)
   )


(global-set-key (kbd "\C-o" ) 'new_line_before)


(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))

(global-set-key "\C-cy" '(lambda ()
   (interactive)
   (popup-menu 'yank-menu)))



(provide 'pelm-editor)
;;; pelm-editor.el ends here				   
