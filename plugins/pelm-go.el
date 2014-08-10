;;; pelm-php.el --- PELM go 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:


(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 
          (lambda ()
            (setq tab-width 2 indent-tabs-mode nil) ;; indent with spaces not tabs
            (local-set-key (kbd "C-c i") 'go-goto-imports)
            (add-hook 'before-save-hook 'gofmt-before-save)
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(provide 'pelm-go)
;; pelm-go.el ends here

