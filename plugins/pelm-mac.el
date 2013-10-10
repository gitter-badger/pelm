;;; pelm-mac.el --- PELM configuration for mac
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(setq mac-allow-anti-aliasing t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

;(set-face-font 'default "Monaco-16")
(set-face-font 'default "Source_Code_Pro-15")
; (set-face-font 'default "Menlo-16")
;  (set-face-font 'default "Anonymous_Pro-18")
;  (set-face-font 'default "BPtypewrite-18")

;; menu bar was ok on mac osx
(menu-bar-mode 1)

;; Make ido ignore fraking .DS_Store files
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Make the browser the OS X default
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; In dired, move deletions to trash
(setq delete-by-moving-to-trash t)'



(defun finder ()
    "Opens file directory in Finder."
      (interactive)
        (let ((file (buffer-file-name)))
              (if file
                        (shell-command
                                   (format "%s %s" (executable-find "open") (file-name-directory file)))
                              (error "Buffer is not attached to any file."))))

;; Use GNU ls - install with:
;;    brew install xz
;;    brew install coreutils
(setq insert-directory-program "gls")

(exec-path-from-shell-initialize)



(provide 'pelm-mac)
;;; ends pelm-mac.el here
