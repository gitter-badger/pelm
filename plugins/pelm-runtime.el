;;; pelm-runtime.el --- PELM runtime 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:


(require 'pelm-defuns)

(defun pelm-add-sub-folders-to-load-path (parent-dir)
  "Adds all first level parent-dir subdirs to the Emacs load path"
  (dolist (f (directory-files parent-dir))
    (let ((name (concat parent-dir f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; add the first level subfolders of vendor 
(pelm-add-sub-folders-to-load-path pelm-vendor-dir)


(defconst pelm-version-number "2.2.0"
  "PELM version number.")
 
(defun pelm-version ()
  "Display string describing the version of PELM."
   (interactive)
   (message "PELM version: %s"
    pelm-version-number))

;; set encodding to utf8
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(defvar pelm-minor-mode-map (make-keymap) "pelm-minor-mode keymap.")

(global-set-key [(control .)] 'pelm-keymap)
(define-prefix-command 'pelm-keymap)

;;; CODO define the pelm group not working
(defgroup pelm nil
    "PELM customization group"
    :prefix "pelm-")

(define-minor-mode pelm-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value nil
  :lighter " PELM"
  :keymap 'pelm-minor-mode-map
  :group 'pelm)


(pelm-minor-mode 1)



(provide 'pelm-runtime)
;;; pelm-runtime.el ends here
