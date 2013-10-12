;;; pelm-ac.el --- PELM emacs lisp
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:
;; configuration

(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'subword-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)



(provide 'pelm-lisp)
;;; pelm-lisp.el ends here

