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

(drag-stuff-global-mode)

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


;;
;; ace jump mode major function
;; 

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;If you use evil
;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;;ack 
(require 'ack-and-a-half)
(setq ack-and-a-half-executable "/usr/local/bin/ack")
;; Create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

(require 'auto-complete)
(require 'auto-complete-config)
(auto-complete-mode)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(provide 'pelm-editor)
;;; pelm-editor.el ends here				   
