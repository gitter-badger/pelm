;;; pelm-yas.el --- PELM yasnippet
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm
;; Version: 0.5.0

;; This file is not part of GNU Emacs

;;; Comentary:


;;; License:

;; MIT license

;;; Code:


;(require 'yasnippet-bundle)


(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)

;(setq yas/root-directory '(
;                           "~/.emacs.d/vendor/yasnippet/snippets"))

(yas/load-directory "~/.emacs.d/snippets")

(require 'dropdown-list)

(setq yas/prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))

(add-hook 'jabber-chat-mode-hook 'yas/minor-mode)

(provide 'pelm-yas)

;;; pelm-yas.el ends here
