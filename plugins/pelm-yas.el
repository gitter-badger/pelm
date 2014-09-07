;;; pelm-yas.el --- PELM yasnippet
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:


;(require 'yasnippet-bundle)


(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;(yas/initialize)


(yas-load-directory "~/.emacs.d/snippets")

(require 'dropdown-list)

(setq yas-prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))

(add-hook 'jabber-chat-mode-hook 'yas-minor-mode)

(provide 'pelm-yas)

;;; pelm-yas.el ends here
