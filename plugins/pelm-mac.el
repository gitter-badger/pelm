;;; pelm-org.el --- PELM configuration for mac
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:


(if (eq system-type 'darwin)
  ;; font set only for mac OSx
  (set-frame-font "Menlo-15"))
  ;;(set-frame-font "DejaVu Sans Mono-15"))


(provide 'pelm-mac)

;;; ends pelm-mac.el here
