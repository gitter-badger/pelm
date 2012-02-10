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


;; bookmark+ 
(require 'bookmark+)
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

provide 'pelm-editor)
;;; pelm-editor.el ends here				   
