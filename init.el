;;; package --- init.el
;;; Commentary:
;; init.el of Pelm
;; Author: eggcaker
;; Last modified: 2015-01-16
;; Version: 2.5.0
;; Built on top of cask and pallet
;;
;;; Code:

;; init cask file
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(when (not (cl-remove-if-not
            (lambda (p) (equal 'org (car p)))
            package-alist))
  (message "No org-mode package found; installing now...")
  (package-install 'org))

(require 'org)
(when (string-match "^[1234567]" (org-version))
  (warn "The PELM expect org 8 or higher, but instead we have %s" (org-version)))

(require 'pallet)

(org-babel-load-file "~/.emacs.d/pelm.org")

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org package-build shut-up epl git commander f dash s))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
