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



(provide 'pelm-editor)

;;; pelm-editor.el ends here				   
