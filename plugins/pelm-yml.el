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


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(provide 'pelm-yml)

;;; pelm-yml.el ends here
