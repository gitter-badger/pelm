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
  (set-face-font 'default "Menlo-15"))
  ;;(set-frame-font "DejaVu Sans Mono-15"))


;; DOING: try the switch the option and command again !
;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))      

(provide 'pelm-mac)

;;; ends pelm-mac.el here
