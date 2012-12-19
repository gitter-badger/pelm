;;; pelm-org.el --- PELM configuration for linux
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(defun pelm-linux-toggle-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(when (string-match "linux" system-configuration)
  (set-face-font 'default "Mono-12")
  (define-key pelm-keymap "uf" 'pelm-linux-toggle-fullscreen))

(provide 'pelm-linux)
;;; ends pelm-linux.el here
