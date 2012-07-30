;;; pelm-php.el --- PELM  PHP
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(el-get-install "php-mode-improved")

;(require 'flymake)

;(defun flymake-php-init ()
;  "Use php to check the syntax of the current file."
;  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
;    (local (file-relative-name temp (file-name-directory buffer-file-name))))
;    (list "php" (list "-f" local "-l"))))
; 
;(add-to-list 'flymake-err-line-patterns
; '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))
;(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))
; 
;(defun run-php()
;  "Run a PHP script "
;  (interactive)
;  (compile (concat "php \"" (buffer-file-name) "\"")))
; 
;(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))
;(define-key php-mode-map "\C-cep" 'flymake-goto-prev-error)
;(define-key php-mode-map "\C-cen" 'flymake-goto-next-error)
;(define-key php-mode-map "\C-csm" 'flymake-display-err-menu-for-current-line)
;(define-key php-mode-map "\C-cr" 'run-php)

(provide 'pelm-php)

;; pelm-php.el ends here
